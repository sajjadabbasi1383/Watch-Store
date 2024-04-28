import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';

import '../component/text_style.dart';
import '../res/colors.dart';
import '../res/dimens.dart';
import '../widget/app_bar.dart';
import '../widget/cart_badge.dart';
import '../widget/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CartBadge(count: 2),
                  Row(
                    children: [
                      const Text(
                        "پرفروش ترین ها",
                        style: AppTextStyles.avatarText,
                      ),
                      AppDimens.small.width,
                      SvgPicture.asset(
                        Assets.svg.sort.path,
                        height: 27,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.svg.close.path),
                    splashRadius: 0.1,
                  )
                ],
              ),
            ),
            body: const Column(
              children: [TagList(), ProductGridView()],
            )));
  }
}




class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.medium,horizontal: AppDimens.small),
      child: SizedBox(
        height: 27,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          reverse: true,
          itemBuilder: (context, index) {
            return Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: AppDimens.small * .6),
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.small,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimens.medium),
                  color: AppColors.primaryColor),
              child: const Center(
                child: Text(
                  "نیوفورس",
                  style: AppTextStyles.tagTitle,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
          itemCount: 20,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 0.66),
            itemBuilder: (context, index) => ProductItem(image: "",productName: "ساعت مردانه", price: "${69000.separateWithComma} تومان",discount: 20,oldPrice: 122000.separateWithComma,specialExpiration: "09:26:38"),));
  }
}
