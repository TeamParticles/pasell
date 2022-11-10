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
class DeleteProductEvent extends AdminProductEvent {
  final String id;
  DeleteProductEvent({this.id});
}

// get Course details by id
class GetDetailsByIdEvent extends AdminProductEvent {
  final String id;
  GetDetailsByIdEvent({this.id});
}
