
import 'dart:convert';
//
  ProductModel ProductModelFromJson(String str) =>
      ProductModel.fromJson(json.decode(str));
  String ProductModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    // required this.email,
    required this.image,
    required this.price,
    required this.description,
    required this.isFavourite,
    required this.status,
    this.qty,
});

  String id;
  String name;
  bool isFavourite;
  // String? email;
  String image;
  double price;
  String description;
  String status;
  int? qty;


  factory ProductModel.fromJson(Map<String,dynamic> json) => ProductModel(
      id: json["id"],
      name: json["name"],
      // email: json["email"],
      price: double.parse(json["price"].toString()),
      description: json["description"],
      isFavourite: false,
      qty: json["qty"],
      status: json["status"],
      image: json["image"],
      );

  Map<String,dynamic> toJson() => {
    "id":id,
    "name":name,
    // "email":email,
    "price":price,
    "description":description,
    // "isFavourite":isFavourite,
    "status":status,
    "image":image,
    "qty":qty,
  };

  ProductModel coptyWith({
    // String? id,
    // String? name,
    // bool? isFavourite,
    // String? image,
    // double? price,
    // String? description,
    // String? status,
    int? qty,
}) =>
      ProductModel(
        id: id,
        name: name,
        description: description,
        image: image,
        isFavourite: isFavourite,
        qty: qty?? this.qty,
        price: price,
        status: status,
      );

}