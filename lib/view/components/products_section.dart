import 'package:ecomerce_demo/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../model/cart_model.dart';
import '../../model/product_model.dart';
import '../../widgets/custom_text.dart';

class ProductsSection extends StatelessWidget {
  final HomeController controller;
  final List<ProductModel>? list;
  final String title;

  const ProductsSection(
      {Key? key,
      required this.controller,
      required this.list,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      final maxWidth = constrains.maxWidth;
      final maxHeight = constrains.maxHeight;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title,
            color: Colors.black,
            fontSize: maxWidth*0.035,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: maxHeight * 0.8,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return GetBuilder<CartController>(
                      init: CartController(),
                      builder: (cart) {
                        return InkWell(
                          onTap: () {
                            cart.addCartModel(CartModel(
                                title: list![index].title,
                                color: list![index].color,
                                price: list![index].price,
                                location: list![index].location,
                                count: 1,
                                typeOfAmount: list![index].typeOfAmount));
                          },
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: maxWidth * 0.3,
                                    height: maxHeight * 0.65,
                                    decoration: BoxDecoration(
                                      color: list![index].color,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  Positioned(
                                    left: -5,
                                    top: -5,
                                    child: Container(
                                      width: maxWidth * 0.08,
                                      height: maxHeight * 0.2,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          if (list ==
                                              controller.productsWithoutDeals) {
                                            controller
                                                .toggleProductsFavorite(index);
                                          }
                                          if (list ==
                                              controller.productsWithDeals) {
                                            controller
                                                .toggleProductsWithDealsFavorite(
                                                    index);
                                          }
                                        },
                                        icon: Icon(
                                          list![index].isFavorite!
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          color: list![index].isFavorite!
                                              ? Colors.red
                                              : Colors.grey,
                                          size: maxWidth * 0.04,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: maxWidth * 0.04,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: maxWidth * 0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      list![index].title!,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: maxWidth*0.035,

                                    ),
                                    SizedBox(
                                      height: maxHeight * 0.07,
                                    ),
                                    CustomText(
                                      'Pieces ${list![index].count}',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      height: maxHeight * 0.07,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.grey,
                                          size: maxWidth * 0.04,
                                        ),
                                        SizedBox(
                                          height: maxHeight * 0.04,
                                        ),
                                        CustomText(
                                          list![index].location!,
                                          color: Colors.grey,
                                          fontSize: maxWidth * 0.03,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: maxHeight * 0.1,
                                    ),
                                    SizedBox(
                                      width: maxWidth * 0.22,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            '\$ ${list![index].price!}',
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          if (list![index].oldPrice!.isNotEmpty)
                                            CustomText(
                                              '\$ ${list![index].oldPrice!}',
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              lineThrough: true,
                                            ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      });
                },
                separatorBuilder: (_, index) {
                  return SizedBox(
                    width: maxWidth * 0.05,
                  );
                },
                itemCount: list!.length),
          ),
        ],
      );
    });
  }
}
