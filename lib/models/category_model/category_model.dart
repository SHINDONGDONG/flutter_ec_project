import 'dart:convert';


CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String  categoryModelToJson(CategoryModel data) => json.encode(data.toJson());


class CategoryModel {
  CategoryModel({
    required this.image,
    required this.id,
    required this.name
});

  String image;
  String id;
  String name;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      CategoryModel(
          image: json['image'],
          name: json['name'],
          id: json['id']);

  Map<String, dynamic> toJson()=> {
    "id":id,
    "name":name,
    "image":image,
  };
}
