
import 'dart:convert';

List<Welcome1> welcomeFromJson(String str) => List<Welcome1>.from(json.decode(str).map((x) => Welcome1.fromJson(x)));

String welcomeToJson(List<Welcome1> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome1 {
  int id;
  int userId;
  DateTime date;
  List<Product> products;
  int v;

  Welcome1({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.v,
  });

  factory Welcome1.fromJson(Map<String, dynamic> json) => Welcome1(
    id: json["id"],
    userId: json["userId"],
    date: DateTime.parse(json["date"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "date": date.toIso8601String(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "__v": v,
  };
}

class Product {
  int productId;
  int quantity;

  Product({
    required this.productId,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["productId"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "quantity": quantity,
  };
}
