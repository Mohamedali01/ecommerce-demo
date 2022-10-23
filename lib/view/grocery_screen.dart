import 'package:flutter/material.dart';
import 'package:ecomerce_demo/constants.dart';
import '../controller/home_controller.dart';
import '../widgets/custom_text.dart';
import 'package:get/get.dart';

import 'components/address_section.dart';
import 'components/banner_section.dart';
import 'components/category_section.dart';
import 'components/location_and_avatar_section.dart';
import 'components/products_section.dart';
import 'components/search_box_section.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top,
        child: LayoutBuilder(builder: (context, constrains) {
          final maxWidth = constrains.maxWidth;
          final maxHeight = constrains.maxHeight;
          print(maxWidth);
          print(maxHeight);
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: maxHeight * 0.02,
                  left: maxWidth * 0.05,
                  bottom: maxHeight * 0.02),
              child: GetBuilder<HomeController>(
                init: HomeController(),
                builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: maxHeight * 0.07,
                              child: const LocationAndAvatarSection(
                                location: 'Mustafa St.',
                              ),
                            ),
                            SizedBox(
                              height: maxHeight * 0.025,
                            ),
                            SizedBox(
                                height: maxHeight * 0.08,
                                child: const SearchBoxSection()),
                            SizedBox(
                              height: maxHeight * 0.025,
                            ),
                            SizedBox(
                                height: maxHeight * 0.12,
                                child: AddressSection(controller: controller)),
                            SizedBox(
                              height: maxHeight * 0.025,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: maxHeight * 0.19,
                          child: CategorySection(controller: controller)),
                      SizedBox(
                        height: maxHeight * 0.025,
                      ),
                      SizedBox(
                        height: maxHeight * 0.24,
                        child: ProductsSection(
                          list: controller.productsWithDeals,
                          controller: controller,
                          title: 'Deals of the day',
                        ),
                      ),
                      SizedBox(
                        height: maxHeight * 0.025,
                      ),
                      SizedBox(
                          height: maxHeight * 0.24,
                          child: const BannerSection()),
                      SizedBox(
                        height: maxHeight * 0.025,
                      ),
                      SizedBox(
                        height: maxHeight * 0.24,
                        child: ProductsSection(
                          list: controller.productsWithoutDeals,
                          controller: controller,
                          title: 'Products',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
