import 'package:ecomerce_demo/controller/cart_controller.dart';
import 'package:ecomerce_demo/controller/home_controller.dart';
import 'package:ecomerce_demo/view/grocery_screen.dart';
import 'package:ecomerce_demo/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import 'cart_screen.dart';
import 'favorites_screen.dart';
import 'news_screen.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  BottomNavigationBarScreen({Key? key}) : super(key: key);
  final List<Widget> screens = [
    const GroceryScreen(),
    const NewsScreen(),
    Container(),
    const FavoritesScreen(),
    CartScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            floatingActionButton: SizedBox(
                height: kHeight*0.09,
                width: kWidth*0.3,
                child: FloatingActionButton(
                  onPressed: () {
                    controller.changeCurrentIndex(4);
                  },
                  backgroundColor: Colors.deepOrange,
                  child: SizedBox(
                    width: kWidth*0.18,
                    child: Stack(
                      children: [
                        Positioned(
                          top: kHeight*0.025,
                          right: kWidth*0.08,
                          child: Center(
                            child: GetBuilder<CartController>(
                              init: CartController(),
                              builder: (cart) {
                                return FittedBox(
                                    child: CustomText(
                                        '\$${cart.totalPrice.toInt()}'));
                              },
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/shopping.png'),
                              SizedBox(
                                width: kWidth*0.05,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children:  [
                                    CircleAvatar(
                                      radius: kWidth*0.005,
                                      backgroundColor: Colors.white,
                                    ),
                                    CircleAvatar(
                                      radius: kWidth*0.005,
                                      backgroundColor: Colors.white,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: SizedBox(
                height: kHeight*0.1,
                child: BottomNavigationBar(
                    elevation: 0.0,
                    iconSize: kWidth*0.07,
                    currentIndex: controller.currentIndex,
                    backgroundColor: const Color(0xffF4F9FA),
                    onTap: (index) {
                      controller.changeCurrentIndex(index);
                    },
                    type: BottomNavigationBarType.fixed,
                    unselectedLabelStyle: const TextStyle(color: Colors.grey),
                    selectedLabelStyle:
                        const TextStyle(color: Colors.deepOrange),
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey.shade400,
                    items: [
                      BottomNavigationBarItem(
                        icon: controller.currentIndex == 0
                            ? Column(
                                children: [
                                  Image.asset(
                                      'assets/images/selected_home.png'),
                                   SizedBox(
                                    height: kHeight*0.008,
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Image.asset('assets/images/home.png'),
                                   SizedBox(
                                    height: kHeight*0.008,
                                  )
                                ],
                              ),
                        label: 'Grocery',
                      ),
                      const BottomNavigationBarItem(
                        icon: FaIcon(FontAwesomeIcons.bell),
                        label: 'News',
                      ),
                      const BottomNavigationBarItem(
                          icon: Icon(
                            Icons.favorite_outline,
                            color: Colors.transparent,
                          ),
                          label: ''),
                      const BottomNavigationBarItem(
                          icon: Icon(Icons.favorite_outline),
                          label: 'Favorites'),
                      const BottomNavigationBarItem(
                          icon: Icon(Ionicons.wallet), label: 'Cart'),
                    ])),
            body: screens[controller.currentIndex],
          );
        });
  }
}
