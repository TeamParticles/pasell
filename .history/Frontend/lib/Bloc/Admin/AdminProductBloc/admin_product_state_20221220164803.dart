part of 'admin_product_bloc.dart';

@immutable
class AdminProductstate {
  final String id;
  // ignore: non_constant_identifier_names
  final String Product;
  final String picture;

  // ignore: non_constant_identifier_names
  AdminProductstate({this.id, this.Product, this.picture});

  // ignore: non_constant_identifier_names
  AdminProductstate copyWith({String id, String Product, String picture}) =>
      AdminProductstate(
        id: id ?? this.id,
        Product: Product ?? this.Product,
        picture: id ?? this.picture,
      );
}

// --------------------------------------------------//
class AddCstate extends AdminProductstate {}

class LoadingAddCstate extends AdminProductstate {}

class AddCsuccessState extends AdminProductstate {}

class FailureAddCstate extends AdminProductstate {
  final String error;

  FailureAddCstate({this.error});
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
