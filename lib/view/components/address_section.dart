import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../controller/home_controller.dart';
import '../../widgets/custom_text.dart';

class AddressSection extends StatelessWidget {
  final HomeController controller;

  const AddressSection({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      final maxWidth = constrains.maxWidth;
      final maxHeight = constrains.maxHeight;

      return SizedBox(
        height: maxHeight,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Container(
                height: maxHeight,
                width: maxWidth * 0.47,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(maxWidth * 0.04),
                    border: Border.all(color: textFieldBorderColor)),
                padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.02),
                child: Row(
                  children: [
                    Container(
                      width: maxWidth * 0.12,
                      height: maxHeight * 0.6,
                      decoration: BoxDecoration(
                        color: const Color(0xffE3DDD6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      width: maxWidth * 0.03,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            '${controller.addressModels[index].addressType.name[0].toUpperCase()}${controller.addressModels[index].addressType.name.substring(1)} Address',
                            color: Colors.black,
                            fontSize: maxWidth * 0.035,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            '${controller.addressModels[index].addressDetails}',
                            fontSize: maxWidth * 0.03,
                            color: Colors.black,
                          ),
                          if (controller.addressModels[index].officeNumber !=
                              null)
                            CustomText(
                              'Floor: ${controller.addressModels[index].floorNumber}, Office ${controller.addressModels[index].officeNumber} ',
                              fontSize: maxWidth * 0.03,
                              color: Colors.black,
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (_, index) {
              return SizedBox(
                width: maxWidth * 0.06,
              );
            },
            itemCount: controller.addressModels.length),
      );
    });
  }
}
