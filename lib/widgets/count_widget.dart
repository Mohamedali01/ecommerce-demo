import 'package:flutter/material.dart';

class CountWidget extends StatelessWidget {
  const CountWidget({Key? key, required this.iconData}) : super(key: key);
final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width:35,
      height: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:const Color(0xffB0EAFD)
      ),
      child: Icon(iconData,color: const Color(0xff47B6DA),),
    );
  }
}
