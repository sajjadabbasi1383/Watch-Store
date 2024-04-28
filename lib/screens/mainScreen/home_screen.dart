import 'package:flutter/material.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widget/cat_widget.dart';

import '../../component/text_style.dart';
import '../../widget/app_slider.dart';
import '../../widget/product_item.dart';
import '../../widget/search_btn.dart';
import '../../widget/vertical_text.dart';

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
          AppDimens.small.height,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
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
                    itemBuilder: (context, index) => ProductItem(
                        productName: "ساعت مردانه",
                        price: "${69000.separateWithComma} تومان",
                        discount: 20,
                        oldPrice: 122000.separateWithComma,
                        timer: "09:26:38"),
                  ),
                ),
                const VerticalText(
                  title: "شگفت انگیز",
                  textStyle: AppTextStyles.amazingProducts,
                )
              ],
            ),
          ),
          //AppDimens.small.height,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
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
                    itemBuilder: (context, index) => ProductItem(
                        productName: "ساعت مردانه",
                        price: "${69000.separateWithComma} تومان",
                        discount: 20,
                        oldPrice: 122000.separateWithComma,
                        timer: "09:26:38"),
                  ),
                ),
                const VerticalText(
                  title: "پرفروش ها",
                  textStyle: AppTextStyles.bestSellersProducts,
                )
              ],
            ),
          ),

          //AppDimens.small.height,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
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
                    itemBuilder: (context, index) => ProductItem(
                        productName: "ساعت مردانه",
                        price: "${69000.separateWithComma} تومان",
                        discount: 20,
                        oldPrice: 122000.separateWithComma,
                        timer: "09:26:38"),
                  ),
                ),
                const VerticalText(
                  title: "جدیدترین ها",
                  textStyle: AppTextStyles.newestProducts,
                )
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
