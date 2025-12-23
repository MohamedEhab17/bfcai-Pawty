import 'package:pawty/features/auth/data/models/request/user_model_dto.dart';

class PetModelDto {
  String? id;
  String? image;
  String? name;
  String? age;
  String? gender;
  String? type;
  String? description;
  String? location;
  String? userId;
  UserModelDto? user;

  PetModelDto({
    this.id,
    this.image,
    this.name,
    this.age,
    this.gender,
    this.type,
    this.description,
    this.location,
    this.userId,
    this.user,
  });

  // PetModelDto.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   image = json['image'];
  //   name = json['name'];
  //   age = json['age'];
  //   gender = json['gender'];
  //   type = json['type'];
  //   description = json['description'];
  //   location = json['location'];
  //   userId = json['userId'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['age'] = age;
    data['gender'] = gender;
    data['type'] = type;
    data['description'] = description;
    data['location'] = location;
    data['userId'] = userId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }

  PetModelDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    type = json['type'];
    description = json['description'];
    location = json['location'];
    userId = json['userId'];
    user = json['user'] != null ? UserModelDto.fromJson(json['user']) : null;
  }
}
