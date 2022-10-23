import 'package:ecomerce_demo/controller/cart_controller.dart';
import 'package:ecomerce_demo/controller/home_controller.dart';
import 'package:ecomerce_demo/view/components/location_and_avatar_section.dart';
import 'package:ecomerce_demo/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/count_widget.dart';
import 'components/products_list_section.dart';

class CartScreen extends StatelessWidget {
  final cart = Get.put(CartController());

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      final maxWidth = constrains.maxWidth;
      final maxHeight = constrains.maxHeight;

      return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return cart.cartModels.isEmpty
              ? const Center(
                  child: CustomText(
                    'No products in the cart Yet',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: maxWidth * 0.05,
                          right: maxWidth * 0.05,
                          top: maxHeight*0.04,
                          bottom: maxHeight*0.1,

                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: maxHeight * 0.06,
                            child: const LocationAndAvatarSection(
                                location: 'Oxford Street'),
                          ),
                           SizedBox(
                            height: maxHeight*0.05,
                          ),
                           CustomText(
                            'Cart',
                            color: Colors.black,
                            fontSize: maxWidth*0.06,
                            fontWeight: FontWeight.bold,
                          ),
                           SizedBox(
                            height: maxHeight*0.05,
                          ),
                          SingleChildScrollView(
                            child: SizedBox(
                              height:maxHeight* 0.7,
                                child:
                                    ProductsListSection(controller: controller)),
                          )
                        ],
                      ),
                    ),
                  ),
                );
        },
      );
    });
  }
}
