import 'package:flutter/material.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/screens/mainscreen/cart_screen.dart';
import 'package:watch_store/screens/mainscreen/home_screen.dart';
import 'package:watch_store/screens/mainscreen/profile_screen.dart';
import 'package:watch_store/widget/btm_nav_item.dart';

class BtmNavScreenIndex {
  BtmNavScreenIndex._();

  static const home = 0;
  static const cart = 1;
  static const profile = 2;
}

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = BtmNavScreenIndex.home;

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
              child: IndexedStack(
                index: selectedIndex,
                children: const [
                  HomeScreen(),
                  CartScreen(),
                  ProfileScreen()
                ],
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
                    BtmNavItem(
                        iconPath: Assets.svg.user.path,
                        text: "پروفایل",
                        isActive: selectedIndex==BtmNavScreenIndex.profile,
                        onTap: ()=>btmNavOnPressed(BtmNavScreenIndex.profile)),
                    BtmNavItem(
                        iconPath: Assets.svg.cart.path,
                        text: "سبد خرید",
                        isActive: selectedIndex==BtmNavScreenIndex.cart,
                        onTap: ()=>btmNavOnPressed(BtmNavScreenIndex.cart)),
                    BtmNavItem(
                        iconPath: Assets.svg.home.path,
                        text: "خانه",
                        isActive: selectedIndex==BtmNavScreenIndex.home,
                        onTap: ()=>btmNavOnPressed(BtmNavScreenIndex.home)),
                  ],
                ),
              ))
        ],
      ),
    ));
  }

  btmNavOnPressed(int index){
    setState(() {
      selectedIndex=index;
    });
  }
}
