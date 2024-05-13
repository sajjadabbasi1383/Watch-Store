import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
    required this.count,
    required this.image,
    required this.add,
    required this.remove,
    required this.delete,
  });

  final String productTitle;
  final int price;
  final int oldPrice;
  final int count;
  final String image;
  final void Function() add;
  final void Function() remove;
  final void Function() delete;

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
                    textAlign: TextAlign.right,
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
                          onPressed: delete,
                          icon: SvgPicture.asset(Assets.svg.delete.path)),
                      const Expanded(child: SizedBox.shrink()),
                      IconButton(
                          onPressed: remove,
                          icon: SvgPicture.asset(Assets.svg.minus.path)),
                      Text(
                        "$count عدد",
                        style: AppTextStyles.productTitle,
                        textDirection: TextDirection.rtl,
                      ),
                      IconButton(
                          onPressed: add,
                          icon: SvgPicture.asset(Assets.svg.plus.path)),
                    ],
                  ),
                ],
              )),
          SizedBox(
            width: 120,
            height: 120,
            child: CachedNetworkImage(
              imageUrl: image,
              height: 120,
              placeholder: (context, url) => Center(
                child: LoadingAnimationWidget.discreteCircle(
                  color: AppColors.loadingColor,
                  secondRingColor: AppColors.amazingColor,
                  thirdRingColor: Colors.grey,
                  size: 20,
                ),
              ),
              errorWidget: (context, url, error) => Center(
                child: Image.asset(Assets.png.mainLogo.path,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
