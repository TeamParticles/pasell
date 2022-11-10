part of 'admin_product_bloc.dart';

@immutable
abstract class AdminProductEvent {}

class AddProductEvent extends AdminProductEvent {
  final ourse product;

  AddProductEvent({this.product});
}

class UpdateProductEvent extends AdminProductEvent {
  final ourse product;

  UpdateProductEvent({this.product});
}

// delete ourse
class DeleteProductEvent extends AdminProductEvent {
  final String id;
  DeleteProductEvent({this.id});
}

// get ourse details by id
class GetProductDetailsByIdEvent extends AdminProductEvent {
  final String id;
  GetProductDetailsByIdEvent({this.id});
}
