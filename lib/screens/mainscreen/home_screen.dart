import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
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
          SearchBtn(
            onTap: () {},
          ),
          const AppSlider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CatWidget(
                  colors: AppColors.catDesktopColors,
                  iconPath: Assets.svg.desktop.path,
                  title: AppStrings.desktop,
                  onTap: () {}),
              CatWidget(
                  colors: AppColors.catDigitalColors,
                  iconPath: Assets.svg.digital.path,
                  title: AppStrings.digital,
                  onTap: () {}),
              CatWidget(
                  colors: AppColors.catSmartColors,
                  iconPath: Assets.svg.smart.path,
                  title: AppStrings.smart,
                  onTap: () {}),
              CatWidget(
                  colors: AppColors.catClassicColors,
                  iconPath: Assets.svg.clasic.path,
                  title: AppStrings.classic,
                  onTap: () {}),
            ],
          ),
          AppDimens.medium.height,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Row(
              children: [
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.all(AppDimens.small),
                      margin: const EdgeInsets.all(AppDimens.medium),
                      height: 298,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppDimens.medium),
                          gradient: const LinearGradient(
                              colors: AppColors.productBgGradiant,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Column(
                        children: [
                          Image.asset(Assets.png.unnamed.path),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "ساعت مردانه",
                              style: AppTextStyles.productTitle,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                children: [
                                  Text("690000 تومان"),
                                  Text("690000"),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(AppDimens.small * .7),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.red),
                                child: const Text("20%"),
                              ),
                            ],
                          ),
                          Container(width: double.infinity,height: 2,color: Colors.blue,),
                          const Text("09:26:38")
                        ],
                      ),
                    ),
                  ),
                ),
                const VerticalText()
              ],
            ),
          )
        ],
      ),
    )));
  }
}

class VerticalText extends StatelessWidget {
  const VerticalText({super.key});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(Assets.svg.back.path),
                const Text("مشاهده همه")
              ],
            ),
            const Text("شگفت انگیز")
          ],
        ),
      ),
    );
  }
}
