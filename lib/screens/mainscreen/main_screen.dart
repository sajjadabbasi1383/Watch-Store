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
  final GlobalKey<NavigatorState> _homekey=GlobalKey();
  final GlobalKey<NavigatorState> _cartkey=GlobalKey();
  final GlobalKey<NavigatorState> _profilekey=GlobalKey();

  late final map={
    BtmNavScreenIndex.home:_homekey,
    BtmNavScreenIndex.cart:_cartkey,
    BtmNavScreenIndex.profile:_profilekey,
  };

  Future<bool> _onWillPop()async{
    if(map[selectedIndex]!.currentState!.canPop()){
      map[selectedIndex]!.currentState!.pop();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double btmNavHeight = size.height * .1;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
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
                  children: [
                    Navigator(
                      key: _homekey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    ),
                    Navigator(
                      key: _cartkey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    ),
                    Navigator(
                      key: _profilekey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    ),
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
                          isActive: selectedIndex == BtmNavScreenIndex.profile,
                          onTap: () =>
                              btmNavOnPressed(BtmNavScreenIndex.profile)),
                      BtmNavItem(
                          iconPath: Assets.svg.cart.path,
                          text: "سبد خرید",
                          isActive: selectedIndex == BtmNavScreenIndex.cart,
                          onTap: () => btmNavOnPressed(BtmNavScreenIndex.cart)),
                      BtmNavItem(
                          iconPath: Assets.svg.home.path,
                          text: "خانه",
                          isActive: selectedIndex == BtmNavScreenIndex.home,
                          onTap: () => btmNavOnPressed(BtmNavScreenIndex.home)),
                    ],
                  ),
                ))
          ],
        ),
      )),
    );
  }

  btmNavOnPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
