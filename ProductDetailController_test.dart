import 'package:pasell/Controller/ProductController.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pasell/Models/Product/FavoriteCourse.dart';
import 'ProductDetailController_test.mocks.dart';

@GenerateMocks([ProductController])
void main() {
  ProductController productController;
  List<Favorite> listProduct;
  setUpAll(() {
    productController = MockOrderController();
    listProduct = [
      Favorite(id: "1"),
      Favorite(
        id: "2",
      ),
    ];
  });

  test('Fetching the product detail', () async {
    when(productController.favoriteProducts())
        .thenAnswer((realInvocation) async => listProduct);

    List<Favorite> result = await productController.favoriteProducts();
    expect(result, listProduct);
  });
}
