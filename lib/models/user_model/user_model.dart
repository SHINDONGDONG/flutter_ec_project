import 'dart:convert';


UserModel UserModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String  UserModelToJson(UserModel data) => json.encode(data.toJson());


class UserModel {
  UserModel({
    this.image,
    required this.id,
    required this.name,
    required this.email,
  });

  String? image;
  String id;
  String name;
  String email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        image: json['image'],
        name: json['name'],
        id: json['id'],
        email: json['email'],
      );

  Map<String, dynamic> toJson()=> {
    "id":id,
    "name":name,
    "image":image,
    "email":email,
  };


  UserModel coptyWith({
    String? name, image,
  }) =>
      UserModel(
        name: name ?? this.name,
        image: image ?? this.image,
        email: email,
        id: id,
      );

}
