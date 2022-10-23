import 'package:flutter/material.dart';

import '../../controller/home_controller.dart';
import '../../widgets/custom_text.dart';


class CategorySection extends StatelessWidget {
  final HomeController controller;

  const CategorySection({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constrains) {
        final maxWidth = constrains.maxWidth;
        final maxHeight = constrains.maxHeight;

        return Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(right: maxWidth*0.05
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const CustomText(
                    'Explore by Category',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    'See All (${controller.categoryModels.length.toString()})',
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
             SizedBox(
              height: maxHeight*0.1,
            ),
            SizedBox(
              height: maxHeight*0.7,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        Container(
                          width: maxWidth*0.18,
                          height: maxHeight*0.48,
                          decoration: BoxDecoration(
                              color: controller.categoryModels[index].color,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          controller.categoryModels[index].name!,
                          fontSize: maxWidth*0.033,
                          color: Colors.black,
                        )
                      ],
                    );
                  },
                  separatorBuilder: (_, index) {
                    return  SizedBox(
                      width: maxWidth*0.037,
                    );
                  },
                  itemCount: controller.categoryModels.length),
            ),
          ],
        );
      }
    );
  }
}
