import 'package:flutter/material.dart';
import 'package:watch_store/component/extension.dart';

import '../component/text_style.dart';
import '../res/colors.dart';
import '../res/dimens.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.image,
    required this.productName,
    required this.price,
    this.oldPrice=0,
    this.timer=0,
    this.discount=0
  });

  final image;
  final productName;
  final price;
  final oldPrice;
  final discount;
  final timer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.medium),
      margin: const EdgeInsets.all(AppDimens.small),
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.medium),
          gradient: const LinearGradient(
              colors: AppColors.productBgGradiant,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Column(
        children: [
          Image.network(image,height: 120,),
          AppDimens.small.height,
           Align(
            alignment: Alignment.centerRight,
            child: Text(
              productName,
              style: AppTextStyles.productTitle,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,
              maxLines: 2,
            ),
          ),
          AppDimens.small.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(price,style: AppTextStyles.productPrice,),
                  Visibility(
                      visible: discount>0,
                      child: Text(oldPrice,style: AppTextStyles.oldPrice,)),
                ],
              ),
              Visibility(
                visible: discount>0,
                child: Container(
                  padding: const EdgeInsets.all(AppDimens.small * .6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.red),
                  child: Text("$discount%",style: AppTextStyles.discount,),
                ),
              ),
            ],
          ),
          AppDimens.medium.height,
          Visibility(
            visible: timer!=null,
              child: Container(width: double.infinity,height: 2,color: Colors.blue,)),
          AppDimens.small.height,
          Visibility(
            visible: timer!=null,
              child: Text(timer,style: AppTextStyles.productTimer,))
        ],
      ),
    );
  }
}

