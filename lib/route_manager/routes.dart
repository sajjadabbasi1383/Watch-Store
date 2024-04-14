import 'package:flutter/material.dart';
import 'package:watch_store/route_manager/screen_names.dart';
import 'package:watch_store/screens/auth/send_otp_screen.dart';
import 'package:watch_store/screens/mainScreen/main_screen.dart';
import 'package:watch_store/screens/product_list_screen.dart';
import 'package:watch_store/screens/product_single_screen.dart';
import 'package:watch_store/screens/auth/register_screen.dart';
import 'package:watch_store/screens/splash_screen.dart';

import '../screens/auth/verify_code_screen.dart';



Map<String,Widget Function(BuildContext)> routes={

  //ScreenNames.root:(context) => const SplashScreen(),
  ScreenNames.root:(context) =>  SendOtpScreen(),
  ScreenNames.verifyCodeScreen:(context) => VerifyCodeScreen(),
  ScreenNames.sendOtpScreen:(context) => SendOtpScreen(),
  ScreenNames.registerScreen:(context) => RegisterScreen(),
  ScreenNames.mainScreen:(context) => MainScreen(),
  ScreenNames.productListScreen:(context) => const ProductListScreen(),
  ScreenNames.productSingleScreen:(context) => const ProductSingleScreen(),

};