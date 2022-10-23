import 'package:flutter/material.dart';

class CartModel{
  String? title;
  int? count;
  String? typeOfAmount;
  String? location;
  String? price;
  Color? color;

  CartModel(
      {this.title,
      this.count,
      this.typeOfAmount,
      this.location,
      this.price,
      this.color});
}