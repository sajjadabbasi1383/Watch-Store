import 'package:flutter/material.dart';

class BascketScreen extends StatelessWidget {
  const BascketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue,
      ),
    ));
  }
}
