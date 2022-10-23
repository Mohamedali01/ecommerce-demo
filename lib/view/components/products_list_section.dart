import 'package:ecomerce_demo/controller/cart_controller.dart';
import 'package:ecomerce_demo/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/count_widget.dart';
import '../../widgets/custom_text.dart';

class ProductsListSection extends StatelessWidget {
  final HomeController controller;

  const ProductsListSection({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      final maxWidth = constrains.maxWidth;
      final maxHeight = constrains.maxHeight;

      return GetBuilder<CartController>(
          init: CartController(),
          builder: (cart) {
            return SingleChildScrollView(
              child: SizedBox(
                height: maxHeight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ListView.separated(
                      itemBuilder: (_, index) {
                        return Dismissible(
                          background: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.red,
                          ),
                          onDismissed: (direction) {
                            cart.removeCartModel(cart.cartModels[index].title);
                            Get.snackbar(
                                'Success', 'Product removed successfully',
                                backgroundColor: Colors.green,
                                colorText: Colors.white);
                          },
                          key: ValueKey(DateTime.now().toString()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: maxWidth * 0.7,
                                child: Row(
                                  children: [
                                    Container(
                                      width: maxWidth * 0.2,
                                      height: maxHeight * 0.15,
                                      decoration: BoxDecoration(
                                          color: cart.cartModels[index].color,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    SizedBox(
                                      width: maxWidth * 0.05,
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            cart.cartModels[index].title!,
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(
                                            height: maxHeight * 0.02,
                                          ),
                                          CustomText(
                                            cart.cartModels[index].typeOfAmount!,
                                            fontSize: maxWidth * 0.03,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(
                                            height: maxHeight * 0.02,
                                          ),
                                          CustomText(
                                            '\$ ${cart.cartModels[index].price!}',
                                            color: Color(0xffB13E55),
                                            fontSize: maxWidth * 0.05,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: maxWidth * 0.3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: maxWidth * 0.1,
                                      height: maxHeight * 0.07,
                                      child: GestureDetector(
                                        onTap: () {
                                          cart.decreaseCartModel(
                                              cart.cartModels[index].title);
                                        },
                                        child: const CountWidget(
                                          iconData: Icons.remove,
                                        ),
                                      ),
                                    ),
                                    CustomText(
                                      cart.cartModels[index].count.toString(),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: maxWidth * 0.05,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        cart.increaseCartModel(
                                            cart.cartModels[index].title);
                                      },
                                      child: const CountWidget(
                                        iconData: Icons.add,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (_, index) {
                        return SizedBox(
                          height: maxHeight * 0.06,
                        );
                      },
                      itemCount: cart.cartModels.length),
                ),
              ),
            );
          });
    });
  }
}
//todo: make products unique by id not title
