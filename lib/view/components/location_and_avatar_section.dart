import 'package:flutter/material.dart';

import '../../widgets/custom_text.dart';

class LocationAndAvatarSection extends StatelessWidget {
  final String? location;

  const LocationAndAvatarSection({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      final maxWidth = constrains.maxWidth;
      final maxHeight = constrains.maxHeight;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: maxHeight,
            width: maxWidth * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/badge.png',
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(maxWidth * 0.009),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                  CustomText(
                    location!,
                    fontSize: maxWidth * 0.04,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: maxWidth * 0.15,
            height: maxHeight,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(25),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
              ),
            ),
          )
        ],
      );
    });
  }
}
