import 'package:flutter/material.dart';
import 'package:watch_store/route_manager/screen_names.dart';
import 'package:watch_store/screens/get_otp_screen.dart';
import 'package:watch_store/screens/mainscreen/main_screen.dart';
import 'package:watch_store/screens/product_list_screen.dart';
import 'package:watch_store/screens/product_single_screen.dart';
import 'package:watch_store/screens/register_screen.dart';
import 'package:watch_store/screens/send_otp_screen.dart';
import 'package:watch_store/screens/splash_screen.dart';


Map<String,Widget Function(BuildContext)> routes={

  ScreenNames.root:(context) => const SplashScreen(),
  ScreenNames.getOtpScreen:(context) => GetOtpScreen(),
  ScreenNames.sendOtpScreen:(context) => SendOtpScreen(),
  ScreenNames.registerScreen:(context) => RegisterScreen(),
  ScreenNames.mainScreen:(context) => MainScreen(),
  ScreenNames.productListScreen:(context) => const ProductListScreen(),
  ScreenNames.productSingleScreen:(context) => const ProductSingleScreen(),

};