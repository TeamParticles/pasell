part of 'admin_product_bloc.dart';

@immutable
class AdminProductstate {
  final String id;
  // ignore: non_constant_identifier_names
  final String Product;
  final String picture;

  // ignore: non_constant_identifier_names
  AdminProductstate({this.id, this.Course, this.picture});

  // ignore: non_constant_identifier_names
  AdminProductstate copyWith({String id, String Course, String picture}) =>
      AdminProductstate(
        id: id ?? this.id,
        Course: Course ?? this.Course,
        picture: id ?? this.picture,
      );
}

// --------------------------------------------------//
class AddCoursestate extends AdminProductstate {}

class LoadingAddCoursestate extends AdminProductstate {}

class AddCoursesuccessState extends AdminProductstate {}

class FailureAddCoursestate extends AdminProductstate {
  final String error;

  FailureAddCoursestate({this.error});
}

// -------------------------------------------------//
class LoadingUpdateCoursestate extends AdminProductstate {}

class UpdateCoursesuccessState extends AdminProductstate {}

class FailureUpdateCoursestate extends AdminProductstate {
  final String error;

  FailureUpdateCoursestate({this.error});
}

// --------------- delete state -------------------
class DeleteCourseLoadingState extends AdminProductstate {}

class DeleteCoursesuccessState extends AdminProductstate {}

class DeleteCourseFailureState extends AdminProductstate {
  final String error;

  DeleteCourseFailureState({this.error});
}

// --------------- get Course details by id state -------------------
class GetCourseByIdLoadingState extends AdminProductstate {}

class GetCourseByIdSuccessState extends AdminProductstate {}

class GetCourseByIdFailureState extends AdminProductstate {
  final String error;

  GetCourseByIdFailureState({this.error});
}
