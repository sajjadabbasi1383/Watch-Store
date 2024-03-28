import 'package:flutter/material.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widget/cat_widget.dart';

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
            const AppSlider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CatWidget(
                    colors: AppColors.catDesktopColors,
                    iconPath: Assets.svg.desktop.path,
                    title: AppStrings.desktop,
                    onTap: (){}),
                CatWidget(
                    colors: AppColors.catDigitalColors,
                    iconPath: Assets.svg.digital.path,
                    title: AppStrings.digital,
                    onTap: (){}),
                CatWidget(
                    colors: AppColors.catSmartColors,
                    iconPath: Assets.svg.smart.path,
                    title: AppStrings.smart,
                    onTap: (){}),
                CatWidget(
                    colors: AppColors.catClassicColors,
                    iconPath: Assets.svg.clasic.path,
                    title: AppStrings.classic,
                    onTap: (){}),
              ],
            )

          ],
        ),
      )
    ));
  }
}


