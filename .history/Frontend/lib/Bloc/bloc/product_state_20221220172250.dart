part of 'product_bloc.dart';


@immutable
class ProductState {
  final List<CourseCart> courses;
  final double total;
  final int amount;
  final double delivery;
  final double insurance;

  ProductState(
      {this.courses,
      this.total = 00.0,
      this.amount = 0,
      this.delivery = 15.0,
      this.insurance = 10.0});

  ProductState copyWith(
          {List<Cart> courses,
          double total,
          int amount,
          double delivery,
          double insurance}) =>
      ProductState(
          courses: courses ?? this.courses,
          total: total ?? this.total,
          amount: amount ?? this.amount,
          delivery: delivery ?? this.delivery,
          insurance: insurance ?? this.insurance);
}
