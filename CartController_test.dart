import 'package:pasell/Controller/CourseController.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pasell/Models/Product/FavoriteCourse.dart';
import 'CartController_test.mocks.dart';

@GenerateMocks([CourseController])
void main() {
  CourseController courseController;
  List<Favorite> listCourse;
  setUpAll(() {
    courseController = MockCartController();
    listCourse = [
      Favorite(id: "1"),
      Favorite(
        id: "2",
      ),
    ];
  });

  test('Fetching list of cart', () async {
    when(courseController.favoriteCourses())
        .thenAnswer((realInvocation) async => listCourse);

    List<Favorite> result = await courseController.favoriteCourses();
    expect(result, listCourse);
  });
}
