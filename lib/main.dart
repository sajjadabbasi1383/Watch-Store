import 'package:flutter/material.dart';
import 'package:watch_store/component/theme.dart';
import 'package:watch_store/screens/get_otp_screen.dart';
import 'package:watch_store/screens/register_screen.dart';
import 'package:watch_store/screens/send_otp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
      home: GetOtpScreen(),
    );
  }
}
