part of 'admin_product_bloc.dart';

@immutable
abstract class AdminProductEvent {}

class AddProductEvent extends AdminProductEvent {
  final Course course;

  AddProductEvent({this.course});
}

class UpdateEvent extends AdminProductEvent {
  final Course course;

  UpdateEvent({this.course});
}

// delete Course
class DeleteCourseEvent extends AdminProductEvent {
  final String id;
  DeleteCourseEvent({this.id});
}

// get Course details by id
class GetCourseDetailsByIdEvent extends AdminProductEvent {
  final String id;
  GetCourseDetailsByIdEvent({this.id});
}
