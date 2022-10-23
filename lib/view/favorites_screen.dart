import 'package:ecomerce_demo/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/count_widget.dart';
import '../widgets/custom_text.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = Get.put(HomeController());
    controller.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      final maxWidth = constrains.maxWidth;
      final maxHeight = constrains.maxHeight;

      return GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return controller.favorites!.isEmpty
                ? const Center(
                    child: CustomText(
                      'No favorites Yet',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: maxHeight * 0.1,
                          left: maxWidth * 0.07,
                          right: maxWidth * 0.07),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            'Favorites',
                            fontSize: maxWidth * 0.06,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: maxHeight * 0.02,
                          ),
                          SizedBox(
                            height: maxHeight * 0.8,
                            child: ListView.separated(
                                itemBuilder: (_, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: maxWidth * 0.17,
                                            height: maxHeight * 0.09,
                                            decoration: BoxDecoration(
                                                color: controller
                                                    .favorites![index].color,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        maxWidth * 0.03)),
                                          ),
                                          SizedBox(
                                            width: maxWidth * 0.05,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                controller
                                                    .favorites![index].title!,
                                                fontSize: maxWidth * 0.03,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              SizedBox(
                                                height: maxHeight * 0.015,
                                              ),
                                              CustomText(
                                                controller.favorites![index]
                                                    .typeOfAmount!,
                                                fontSize: 12,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              SizedBox(
                                                height: maxHeight * 0.015,
                                              ),
                                              CustomText(
                                                '\$ ${controller.favorites![index].price!}',
                                                color: const Color(0xffB13E55),
                                                fontSize: maxWidth*0.04,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (_, index) {
                                  return SizedBox(
                                    height: maxHeight * 0.03,
                                  );
                                },
                                itemCount: controller.favorites!.length),
                          )
                        ],
                      ),
                    ),
                  );
          });
    });
  }
}
