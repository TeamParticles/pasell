part of 'admin_product_bloc.dart';

@immutable
abstract class AdminProductEvent {}

class AddProductEvent extends AdminProductEvent {
  final Course ;

  AddProductEvent({this.});
}

class UpdateProductEvent extends AdminProductEvent {
  final Course ;

  UpdateProductEvent({this.});
}

// delete Course
class DeleteProductEvent extends AdminProductEvent {
  final String id;
  DeleteProductEvent({this.id});
}

// get Course details by id
class GetProductDetailsByIdEvent extends AdminProductEvent {
  final String id;
  GetProductDetailsByIdEvent({this.id});
}
