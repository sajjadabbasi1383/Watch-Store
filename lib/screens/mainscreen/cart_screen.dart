import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widget/app_bar.dart';

import '../../widget/shopping_cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
            child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            AppStrings.basket,
            style: AppTextStyles.appBarText,
          ),
        )),
        body: Column(
          children: [
            Container(
              height: size.height * .105,
              width: double.infinity,
              margin: const EdgeInsets.only(
                  top: AppDimens.medium, bottom: AppDimens.small),
              padding: const EdgeInsets.all(AppDimens.medium),
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: AppColors.shadow,
                    offset: Offset(0, 2),
                    blurRadius: 4)
              ]),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(Assets.svg.leftArrow.path)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.sendToAddress,
                          style: AppTextStyles.productCaption,
                        ),
                        Text(
                          AppStrings.fakeAddress,
                          style: AppTextStyles.avatarText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return ShoppingCartItem(
                  productTitle: "ساعت شیائومی mi Watch lite",
                  price: 60000,
                  oldPrice: 50000,
                );
              },
            )),
            Container(
              height: 60,
              width: double.infinity,
              color: Colors.blueGrey,
            )
          ],
        ),
      ),
    );
  }
}
