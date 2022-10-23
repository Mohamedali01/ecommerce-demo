import 'package:flutter/material.dart';

import '../../widgets/custom_text.dart';


class BannerSection extends StatelessWidget {
  const BannerSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constrains) {
        final maxWidth = constrains.maxWidth;
        final maxHeight = constrains.maxHeight;

        return Padding(
          padding: EdgeInsets.only(right: maxWidth*0.05),
          child: Container(
            height: maxHeight,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xffFEC8BD),
                borderRadius: BorderRadius.circular(maxWidth*0.04)),
            child: Row(
              children: [
                Expanded(flex: 2, child: Container()),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       CustomText(
                        'Mega',
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: maxWidth*0.04,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children:  [
                            CustomText(
                              'WHOPP',
                              fontSize: maxWidth*0.09,
                              color: const Color(0xff21114B),
                              fontWeight: FontWeight.bold,
                            ),
                            Positioned(
                              left: maxWidth*0.335,
                              child: CustomText(
                                'E',
                                fontSize: maxWidth*0.09,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Positioned(
                              left: maxWidth*0.4,
                              child: CustomText(
                                'R',
                                fontSize: maxWidth*0.09,
                                color: const Color(0xff21114B),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                       SizedBox(
                        height: maxHeight*0.06,
                      ),
                      SizedBox(
                        width: maxWidth*0.335,
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children:  [
                            CustomText(
                              '\$ 17',
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: maxWidth*0.05,
                            ),
                            CustomText(
                              '\$ 32',
                              fontWeight: FontWeight.bold,
                              lineThrough: true,
                              fontSize: maxWidth*0.05,
                            ),
                          ],
                        ),
                      ),
                       SizedBox(
                        height: maxHeight*0.05,
                      ),
                       CustomText(
                        '* Available until 24 December 2020',
                        fontSize: maxWidth*0.03,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
