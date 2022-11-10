part of 'admin_product_bloc.dart';

@immutable
abstract class AdminProductEvent {}

class AddCourseEvent extends AdminProductEvent {
  final Course course;

  AddCourseEvent({this.course});
}

class UpdateCourseEvent extends AdminProductEvent {
  final Course course;

  UpdateCourseEvent({this.course});
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
