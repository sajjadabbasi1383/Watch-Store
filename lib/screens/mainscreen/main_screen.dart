import 'package:flutter/material.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/widget/btm_nav_item.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double btmNavHeight = size.height * .1;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: btmNavHeight,
              child: Container(
                color: Colors.red,
              )),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: btmNavHeight,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BtmNavItem(iconPath: Assets.svg.user.path, text: "پروفایل", isActive: false, onTap: (){}),
                    BtmNavItem(iconPath: Assets.svg.cart.path, text: "سبد خرید", isActive: false, onTap: (){}),
                    BtmNavItem(iconPath: Assets.svg.home.path, text: "خانه", isActive: true, onTap: (){}),
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}
