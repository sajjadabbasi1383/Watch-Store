import 'package:flutter/material.dart';

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
