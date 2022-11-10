part of 'product_bloc.dart';



@immutable
abstract class ProductEvent {}

class AddOrDeleteCourseFavorite extends ProductEvent {
  final String uidCourse;

  AddOrDeleteCourseFavorite({this.uidCourse});
}

class AddCourseToCart extends ProductEvent {
  final CourseCart course;

  AddCourseToCart({this.course});
}

class DeleteCourseToCart extends ProductEvent {
  final int index;

  DeleteToCart({this.index});
}

class PlusQuantityProduct extends ProductEvent {
  final int plus;

  PlusQuantityProduct({this.plus});
}

class SubtractQuantityProductEvent extends ProductEvent {
  final int subtract;

  SubtractQuantityProductEvent({this.subtract});
}

class SaveProductsBuy extends ProductEvent {
  final String user;
  final String date;
  final String amount;
  final List product;

  SaveProductsBuy({this.user, this.date, this.amount, this.product});
}

class ClearProductsEvent extends ProductEvent {}
