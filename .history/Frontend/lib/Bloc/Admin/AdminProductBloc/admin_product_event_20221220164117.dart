part of 'admin_product_bloc.dart';

@immutable
abstract class AdminProductEvent {}

class AddProductEvent extends AdminProductEvent {
  final Course course;

  AddProductEvent({this.course});
}

class UpdateProductEvent extends AdminProductEvent {
  final Course course;

  UpdateProductEvent({this.course});
}

// delete Course
class DeleteEvent extends AdminProductEvent {
  final String id;
  DeleteEvent({this.id});
}

// get Course details by id
class GetCourseDetailsByIdEvent extends AdminProductEvent {
  final String id;
  GetCourseDetailsByIdEvent({this.id});
}
