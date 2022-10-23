import 'package:flutter/material.dart';
import 'package:ecomerce_demo/constants.dart';
class SearchBoxSection extends StatelessWidget {
  const SearchBoxSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constrains) {
        final maxWidth = constrains.maxWidth;
        final maxHeight = constrains.maxHeight;

        return TextField(
          decoration: InputDecoration(
            prefixIcon:  Icon(
              Icons.search,
              color: Colors.black54,
              size: maxWidth*0.06,
            ),
            hintText: 'Search in thousands of products',
            hintStyle: const TextStyle(color: Colors.black54,fontSize: 14),
            filled: true,
            fillColor: const Color(0xffF5F7F9),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: textFieldBorderColor),
              borderRadius: BorderRadius.circular(maxWidth*0.04),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(maxWidth*0.04),
              borderSide: const BorderSide(color: textFieldBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(maxWidth*0.04),
              borderSide: const BorderSide(color: textFieldBorderColor),
            ),
          ),
        );
      }
    );
  }
}
