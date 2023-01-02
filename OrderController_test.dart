import 'package:pasell/Controller/ProductController.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pasell/Models/Response/PurchasedProductsResponse.dart';
import 'OrderController_test.mocks.dart';

@GenerateMocks([CourseController])
void main() {
  ProductController productController;
  // List<Favorite> listCourse;
  setUpAll(() {
    productController = MockOrderController();
  });

  test('Fetching order list', () async {
    when(productController.getPurchasedProducts())
        .thenAnswer((realInvocation) async => await null);

    Future<PurchasedProductsResponse> result = (await productController
        .getPurchasedProducts()) as Future<PurchasedProductsResponse>;
    expect(result, null);
  });
}
