import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widget/app_bar.dart';
import 'package:watch_store/widget/cart_badge.dart';
import 'package:watch_store/widget/main_button.dart';

import '../component/button_style.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: Scaffold(
            body: SafeArea(
                child: Scaffold(
      appBar: CustomAppBar(
        child: Row(
          children: [
            const CartBadge(
              count: 2,
            ),
            const Expanded(
                child: Text(
              "مسواک بنسر مدل اکسترا",
              style: AppTextStyles.catTitle,
              textDirection: TextDirection.rtl,
            )),
            IconButton(
                onPressed: () {}, icon: SvgPicture.asset(Assets.svg.close.path))
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Image.asset(
                  Assets.png.unnamed.path,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Container(
                  margin: const EdgeInsets.all(AppDimens.medium),
                  padding: const EdgeInsets.all(AppDimens.medium),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppDimens.medium)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "بنسر",
                        style: AppTextStyles.productTitle,
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        "مسواک بنسر مدل اکسترا با برس متوسط",
                        style: AppTextStyles.productCaption,
                        textDirection: TextDirection.rtl,
                      ),
                      const Divider(),
                      const ProductTabView()
                    ],
                  ),
                ),
                65.height
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: double.infinity,
              height: 72,
              padding: const EdgeInsets.all(AppDimens.medium),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow,
                    offset: Offset(0,-2),
                    blurRadius: 20
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${69000.separateWithComma} تومان",
                            textDirection: TextDirection.rtl,
                            style: AppTextStyles.productPrice,
                          ),
                          AppDimens.small.width,
                          Visibility(
                            visible: 20 > 0,
                            child: Container(
                              padding:
                                  const EdgeInsets.all(AppDimens.small * .31),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: Colors.red),
                              child: const Text(
                                "20%",
                                style: AppTextStyles.discount,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                          visible: 20 > 0,
                          child: Text(
                            122000.separateWithComma,
                            style: AppTextStyles.oldPrice,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .055,
                    width: size.width * .4,
                    child: ElevatedButton(
                      style: AppButtonStyle.mainButtonStyle,
                      onPressed: () {},
                      child: const Text(
                        "افزودن به سبد خرید",
                        style: AppTextStyles.mainButton,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ))));
  }
}

class ProductTabView extends StatefulWidget {
  const ProductTabView({super.key});

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {
  var selectedTab = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 50,
          child: ListView.builder(
            itemCount: tabs.length,
            scrollDirection: Axis.horizontal,
            itemExtent: MediaQuery.sizeOf(context).width / 3,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => setState(() => selectedTab = index),
                child: Container(
                  padding: const EdgeInsets.all(AppDimens.medium),
                  child: Text(
                    tabs[index],
                    style: index == selectedTab
                        ? AppTextStyles.selectedTab
                        : AppTextStyles.unSelectedTab,
                  ),
                ),
              );
            },
          ),
        ),
        IndexedStack(
          index: selectedTab,
          children: [const Comments(), const Review(), const Features()],
        )
      ],
    );
  }

  List<String> tabs = [
    "نظرات",
    "نقد وبررسی",
    "خصوصیات",
  ];
}

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.lurem,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.justify,
      style: AppTextStyles.productDetail,
    );
  }
}

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "برای این محصول هیچ نقد و بررسی ثبت نشده است!",
      textDirection: TextDirection.rtl,
      style: AppTextStyles.appBarText,
    ));
  }
}

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "برای این محصول هیچ نظری ثبت شده است!",
      textDirection: TextDirection.rtl,
      style: AppTextStyles.appBarText,
    ));
  }
}
