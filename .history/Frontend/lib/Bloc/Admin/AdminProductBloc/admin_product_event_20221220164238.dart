part of 'admin_product_bloc.dart';

@immutable
abstract class AdminProductEvent {}

class AddProductEvent extends AdminProductEvent {
  final Course Product;

  AddProductEvent({this.Product});
}

class UpdateProductEvent extends AdminProductEvent {
  final Course Product;

  UpdateProductEvent({this.Product});
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
