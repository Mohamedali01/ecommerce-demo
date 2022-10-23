import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final bool? lineThrough;

  const CustomText(this.text,
      {super.key,
      this.fontSize,
      this.fontWeight,
      this.color = Colors.white,
      this.lineThrough = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          decoration:
              lineThrough! ? TextDecoration.lineThrough : TextDecoration.none),
    );
  }
}
