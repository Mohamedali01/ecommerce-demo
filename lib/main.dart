import 'package:device_preview/device_preview.dart';
import 'package:ecomerce_demo/constants.dart';
import 'package:ecomerce_demo/view/bottom_navigatio_bar_screen.dart';
import 'package:ecomerce_demo/view/grocery_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {

  // runApp(const MyApp());

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarScreen(),
      theme: ThemeData(
        canvasColor: const Color(0xffFDFFFF),
      ),
    );
  }
}
