import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';

import '../component/text_style.dart';
import '../res/colors.dart';
import '../res/dimens.dart';
import '../res/strings.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, size.height * .07),
        child: Container(
          height: size.height * .07,
          decoration: const BoxDecoration(
              color: AppColors.appbar,
              boxShadow: [
                BoxShadow(
                    color: AppColors.shadow,
                    offset: Offset(0, 2),
                    blurRadius: 3)
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppDimens.medium),
                bottomRight: Radius.circular(AppDimens.medium),
              )),
          child: Padding(
            padding: const EdgeInsets.only(
                left: AppDimens.medium, right: AppDimens.medium),
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
        ),
      ),
      body: const Center(
        child: Text("لیست محصولات"),
      ),
    ));
  }
}

class CartBadge extends StatelessWidget {
  const CartBadge({super.key, this.count = 0});

  final count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          height: 33,
          width: 33,
        ),
        SvgPicture.asset(
          Assets.svg.cart.path,
          color: Colors.black,
          height: 28,
        ),
        Visibility(
            visible: count > 0 ? true : false,
            child: Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  child: Text(
                    count.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ))),
      ],
    );
  }
}
