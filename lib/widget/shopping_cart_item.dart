import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/widget/surface_container.dart';

import '../component/text_style.dart';
import '../gen/assets.gen.dart';
import '../res/colors.dart';

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({
    super.key,
    required this.productTitle,
    required this.price,
    required this.oldPrice,
  });

  final String productTitle;
  final int price;
  final int oldPrice;
  final int count = 1;

  @override
  Widget build(BuildContext context) {
    return SurfaceContainer(
      child: Row(
        children: [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    productTitle,
                    style: AppTextStyles.productTitle,
                  ),
                  Text(
                    "قیمت  : ${price.separateWithComma} تومان",
                    style: AppTextStyles.productCaption,
                  ),
                  Text(
                    "با تخفیف: ${oldPrice.separateWithComma}  تومان",
                    style: AppTextStyles.productCaption
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(Assets.svg.delete.path)),
                      const Expanded(child: SizedBox.shrink()),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(Assets.svg.minus.path)),
                      Text(
                        "$count عدد",
                        style: AppTextStyles.productTitle,
                        textDirection: TextDirection.rtl,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(Assets.svg.plus.path)),
                    ],
                  ),
                ],
              )),
          Image.asset(
            Assets.png.unnamed.path,
            height: 105,
          )
        ],
      ),
    );
  }
}
