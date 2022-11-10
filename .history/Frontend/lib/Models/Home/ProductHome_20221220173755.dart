import 'dart:convert';


ProductsHome coursesHomeFromJson(String str) =>
    ProductsHome.fromJson(json.decode(str));

String coursesHomeToJson(ProductsHome data) => json.encode(data.toJson());

class ProductsHome {
  ProductsHome({
    this.resp,
    this.msj,
    this.products,
  });

  bool resp;
  String msj;
  List<Course> products;

  factory ProductsHome.fromJson(Map<String, dynamic> json) {
    return ProductsHome(
      resp: json["resp"],
      msj: json["msj"],
      products: List<Product>.from(json["products"].map((x) {
        return Product.fromJson(x);
      })),
    );
  }

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "msj": msj,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Course({
    this.status,
    this.id,
    this.nameCourse,
    this.description,
    this.codeCourse,
    this.stock,
    this.price,
    this.picture,
    this.categoryId,
    this.v,
  });

  String status;
  String id;
  String nameCourse;
  String description;
  String codeCourse;
  int stock;
  double price;
  String picture;
  CategoryId categoryId;
  int v;

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      status: json["status"],
      id: json["_id"],
      nameCourse: json["nameProduct"],
      description: json["description"],
      codeCourse: json["codeProduct"],
      stock: json["stock"],
      price: json["price"].toDouble(),
      picture: json["picture"],
      categoryId: CategoryId.fromJson(json["category_id"]),
      // categoryId: CategoryId.fromJson(json["category_id"]),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "_id": id,
        "nameProduct": nameCourse,
        "description": description,
        "codeProduct": codeCourse,
        "stock": stock,
        "price": price,
        "picture": picture,
        "category_id": categoryId.toJson(),
        "__v": v,
      };
}

class CategoryId {
  CategoryId({
    this.id,
    this.category,
  });

  String id;
  String category;

  factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
        id: json["_id"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category,
      };
}
