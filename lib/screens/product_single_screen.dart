import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/widget/app_bar.dart';
import 'package:watch_store/widget/cart_badge.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
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
