import 'package:ecomerce_demo/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<CartModel> cartModels = [];
  double totalPrice = 0.0;

  void addCartModel(CartModel cartModel) {
    bool temp = false;
    for (var element in cartModels) {
      if (cartModel.title == element.title) {
        temp = true;
      }
    }
    if (!temp) {
      cartModels.add(cartModel);
      Get.snackbar('Success', 'Product added successfully',
          backgroundColor: Colors.green, colorText: Colors.white);
      calculateTotalPrice();
      update();
    } else {
      Get.snackbar('Oops!', 'Product already in the cart',
          backgroundColor: Colors.grey, colorText: Colors.white);
    }
    print(cartModels);
  }

  void removeCartModel(String? title) {
    var cartModelIndex =
        cartModels.indexWhere((element) => element.title == title);
    cartModels.removeAt(cartModelIndex);
    calculateTotalPrice();
    update();
  }

  void increaseCartModel(String? title) {
    var cartModelIndex =
        cartModels.indexWhere((element) => element.title == title);
    cartModels[cartModelIndex].count = (cartModels[cartModelIndex].count! + 1);
    calculateTotalPrice();
    update();
  }

  void decreaseCartModel(String? title) {
    var cartModelIndex =
        cartModels.indexWhere((element) => element.title == title);
    if (cartModels[cartModelIndex].count! > 0) {
      cartModels[cartModelIndex].count =
          (cartModels[cartModelIndex].count! - 1);
      calculateTotalPrice();
      update();
    }



  }

  void calculateTotalPrice(){
    double total = 0.0;
    for (var element in cartModels) {
      total += (element.count! * double.parse(element.price!));
    }
    totalPrice = total;
    update();
  }

}
