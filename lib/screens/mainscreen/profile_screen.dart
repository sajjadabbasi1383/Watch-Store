import 'package:flutter/material.dart';

import '../product_single_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.yellow,
        child: Center(
          child: ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductSingleScreen(),
                  )),
              child: const Text("مشاهده همه")),
        ),
      ),
    ));
  }
}
