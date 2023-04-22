import 'package:hive_flutter/hive_flutter.dart';
part 'coffee_model.g.dart';

@HiveType(typeId: 0)
class CoffeeModel extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  List<String>? ingredients;
  @HiveField(3)
  String? image;
  @HiveField(4)
  int? id;

  CoffeeModel(
      {this.title, this.description, this.ingredients, this.image, this.id});

  CoffeeModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    ingredients = json['ingredients'].cast<String>();
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['description'] = description;
    data['ingredients'] = ingredients;
    data['image'] = image;
    data['id'] = id;
    return data;
  }
}
