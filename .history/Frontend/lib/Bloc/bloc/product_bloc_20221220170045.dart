import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pasell/Controller/ProductController.dart';
import 'package:pasell/Models/Product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState());

  List<CourseCart> product = [];

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is AddOrDeleteCourseFavorite) {
      yield* mapEventAddOrDeleteCourseFavorite(event.uidCourse);
    } else if (event is AddCourseToCart) {
      final hasCourse = product.contains(event.product);

      if (!hasCourse) {
        product.add(event.product);

        double sum = 0;
        product.forEach((e) {
          sum = sum + e.price;
        });

        yield state.copyWith(
            courses: product, total: sum, amount: product.length);
      }
    } else if (event is DeleteCourseToCart) {
      product.removeAt(event.index);

      double sum = 0;
      product.forEach((e) {
        sum = sum + e.price;
      });

      yield state.copyWith(courses: product, total: sum, amount: product.length);
    } else if (event is PlusQuantityCourse) {
      product[event.plus].amount++;

      double total = 0;
      product.forEach((e) {
        total = total + (e.price * e.amount);
      });

      yield state.copyWith(courses: product, total: total);
    } else if (event is SubtractQuantityCourseEvent) {
      product[event.subtract].amount--;

      double total = 0;
      product.forEach((e) {
        total = total - (e.price * e.amount);
      });

      yield state.copyWith(courses: product, total: total.abs());
    } else if (event is ClearCoursesEvent) {
      product.clear();

      yield state.copyWith(
        amount: 00,
        delivery: 0.0,
        insurance: 0.0,
        Products: product,
        total: 00.0,
      );
    } else if (event is SaveCoursesBuy) {
      try {
        await dbCourseController.saveOrderBuyCourse(
            receipt: 'Ticket',
            date: event.date,
            amount: event.amount,
            products: event.product);
      } catch (e) {
        print('Something went wrong!');
        print(e.toString());
      }
    }
  }

  Stream<ProductState> mapEventAddOrDeleteCourseFavorite(
      String uidCourse) async* {
    try {
      final resp = await dbCourseController.addOrDeleteCourseFavorite(
          uidCourse: uidCourse);

      if (resp.resp) {}
    } catch (e) {}
  }
}
