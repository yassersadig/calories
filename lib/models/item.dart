import 'dart:convert';
import 'package:calories/models/unitOfMeasure.dart';
import 'package:flutter/material.dart';

class Item {
  int id;
  String name;
  Image photo;
  int calories;
  int protein;
  UnitOfMeasure unit;

  Item({this.name,this.calories,this.protein});

  factory Item.fromMap(Map<String, dynamic> json) => new Item(
        name: json["name"],
        calories: json["calories"],
        protein: json["protein"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "calories": calories,
        "protein": protein,
      };

  Item itemFromJson(String str) {
    final jsonData = json.decode(str);
    return Item.fromMap(jsonData);
  }
}

