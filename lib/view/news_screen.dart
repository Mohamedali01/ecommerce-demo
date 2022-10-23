import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';


class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText('No News Yet',color: Colors.black,fontWeight: FontWeight.bold,),
    );
  }
}
