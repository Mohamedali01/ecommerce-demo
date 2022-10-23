import 'package:flutter/material.dart';

class ProductModel {
  String? title;
  int? count;
  String? typeOfAmount;
  String? location;
  String? price;
  String? oldPrice;
  bool? isFavorite;
  bool? dealsOfDay;
  Color? color;

  ProductModel({
    this.title,
    this.count,
    this.typeOfAmount,
    this.location,
    this.price,
    this.oldPrice,
    this.isFavorite = false,
    this.dealsOfDay = false,
    this.color,
  });
}
