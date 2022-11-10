part of 'admin_product_bloc.dart';

@immutable
abstract class AdminProductEvent {}

class AddProductEvent extends AdminProductEvent {
  final  product;

  AddProductEvent({this.product});
}

class UpdateProductEvent extends AdminProductEvent {
  final  product;

  UpdateProductEvent({this.product});
}

// delete 
class DeleteProductEvent extends AdminProductEvent {
  final String id;
  DeleteProductEvent({this.id});
}

// get  details by id
class GetProductDetailsByIdEvent extends AdminProductEvent {
  final String id;
  GetProductDetailsByIdEvent({this.id});
}
