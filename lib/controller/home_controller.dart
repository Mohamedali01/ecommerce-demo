import 'package:ecomerce_demo/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/address_model.dart';
import '../model/category_model.dart';
import '../model/product_model.dart';

class HomeController extends GetxController {
  ///      demo data

  List<AddressModel> addressModels = [
    AddressModel(
      addressDetails: 'Mustafa St. No:2\nStreet x12',
      addressType: AddressType.home,
    ),
    AddressModel(
      addressType: AddressType.office,
      addressDetails: 'Axis Istanbul, B2 Block',
      floorNumber: '2',
      officeNumber: '11',
    )
  ];
  List<CategoryModel> categoryModels = [
    CategoryModel(color: kLightPinkColor, name: 'Steak'),
    CategoryModel(color: kLightYellowColor, name: 'Vegetables'),
    CategoryModel(color: kLightMoveColor, name: 'Beverages'),
    CategoryModel(color: kLightGreenColor, name: 'Fish'),
    CategoryModel(color: kDarkPinkColor, name: 'Juice'),
  ];

//Bottom Navigation Logic

  int currentIndex = 0;

  void changeCurrentIndex(int index) {
    currentIndex = index;
    update();
  }

  ///   Grocery Logic

  HomeController() {


    productsWithoutDeals = productModels!.where((element) => !element.dealsOfDay!).toList();
    productsWithDeals =
        productModels!.where((element) => element.dealsOfDay!).toList();
  }

  List<ProductModel>? productModels = [
    ProductModel(
        title: 'Summer Sun Ice Cream Pack',
        count: 5,
        isFavorite: false,
        location: '15 Minutes Away',
        oldPrice: '18',
        typeOfAmount: '2 pieces',
        price: '12',
        dealsOfDay: true,

        color: const Color(0xffFBEDD8)),
    ProductModel(
        title: 'Ice Cream',
        count: 9,
        isFavorite: true,
        location: '20 minutes away',
        dealsOfDay: true,
        oldPrice: '30',
        price: '19',
        typeOfAmount: '2 pieces',
        color: const Color(0xffC1E7DA)),
    ProductModel(
      title: 'Turkish Steak',
      count: 9,
      typeOfAmount: '173 Grams',
      isFavorite: true,
      location: '20 minutes away',
      dealsOfDay: false,
      oldPrice: '',
      price: '25',
      color: kLightPinkColor,
    ),
    ProductModel(
      title: 'Salmon',
      count: 9,
      typeOfAmount: '173 Grams',
      isFavorite: true,
      location: '20 minutes away',
      dealsOfDay: false,
      oldPrice: '',
      price: '30',
      color: kLightGreenColor,
    ),
    ProductModel(
      title: 'Red Juice',
      count: 9,
      typeOfAmount: '1 Bottle',
      isFavorite: true,
      location: '20 minutes away',
      dealsOfDay: false,
      oldPrice: '',
      price: '25',
      color: kDarkPinkColor,
    ),
    ProductModel(
      title: 'Cola',
      count: 9,
      typeOfAmount: '1 Bottle',
      isFavorite: true,
      location: '20 minutes away',
      dealsOfDay: false,
      oldPrice: '',
      price: '11',
      color: kLightMoveColor,
    ),

  ];

  List<ProductModel>? productsWithoutDeals;
  List<ProductModel>? productsWithDeals;
  List<ProductModel>? favorites;

  void toggleProductsFavorite(int index) {
    productsWithoutDeals![index].isFavorite = !productsWithoutDeals![index].isFavorite!;
    update();
  }

  void toggleProductsWithDealsFavorite(int index) {
    productsWithDeals![index].isFavorite =
        !productsWithDeals![index].isFavorite!;
    update();
  }

  void getFavorites(){
    List<ProductModel> temp = [];

    temp.addAll(productsWithoutDeals!.where((element) => element.isFavorite!).toList());
    temp.addAll(productsWithDeals!.where((element) => element.isFavorite!).toList());
    favorites = temp;
  }








// List<ProductModel> products() {
//   return productModels.where((element) => !element.dealsOfDay!).toList();
// }
//
// List<ProductModel> productsWithDeals() {
//   return productModels.where((element) => element.dealsOfDay!).toList();
// }
}
