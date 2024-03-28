import 'package:flutter/material.dart';

import '../../widget/app_slider.dart';
import '../../widget/search_btn.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SearchBtn(onTap: () {},),
            AppSlider(),
          ],
        ),
      )
    ));
  }
}

