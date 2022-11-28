import 'package:pasell/Controller/CourseController.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pasell/Models/Response/PurchasedCoursesResponse.dart';
import 'OrderController_test.mocks.dart';

@GenerateMocks([CourseController])
void main() {
  CourseController courseController;
  // List<Favorite> listCourse;
  setUpAll(() {
    courseController = MockOrderController();
  });

  test('Fetching order list', () async {
    when(courseController.getPurchasedCourses())
        .thenAnswer((realInvocation) async => await null);

    Future<PurchasedCoursesResponse> result = (await courseController
        .getPurchasedCourses()) as Future<PurchasedCoursesResponse>;
    expect(result, null);
  });
}
