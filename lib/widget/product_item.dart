import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_store/component/extension.dart';

import '../component/text_style.dart';
import '../res/colors.dart';
import '../res/dimens.dart';
import '../utils/format_time.dart';

class ProductItem extends StatefulWidget {
  const ProductItem(
      {super.key,
      required this.image,
      required this.productName,
      required this.price,
      this.oldPrice = 0,
      this.specialExpiration = "",
      this.discount = 0});

  final image;
  final productName;
  final price;
  final oldPrice;
  final discount;
  final specialExpiration;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  Duration _duration = Duration(seconds: 0);
  late Timer _timer;
  late int inSeconds;
  late DateTime now;
  late DateTime expiration;

  @override
  void initState() {
    super.initState();

    now = DateTime.now();
    expiration = DateTime.parse(widget.specialExpiration);
    _duration = now.difference(expiration).abs();
    inSeconds = _duration.inSeconds;
    startTimer();
  }

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
          CachedNetworkImage(
            imageUrl: widget.image,height: 120,
            placeholder: (context, url) => Center(
              child: LoadingAnimationWidget.discreteCircle(
                color: AppColors.loadingColor,
                secondRingColor: AppColors.amazingColor,
                thirdRingColor: Colors.grey,
                size: 20,
              ),
            ),
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.error),
            ),
          ),
          // Image.network(
          //   widget.image,
          //   height: 120,
          // ),
          AppDimens.small.height,
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.productName,
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
                  Text(
                    widget.price,
                    style: AppTextStyles.productPrice,
                  ),
                  Visibility(
                      visible: widget.discount > 0,
                      child: Text(
                        widget.oldPrice,
                        style: AppTextStyles.oldPrice,
                      )),
                ],
              ),
              Visibility(
                visible: widget.discount > 0,
                child: Container(
                  padding: const EdgeInsets.all(AppDimens.small * .6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.red),
                  child: Text(
                    "${widget.discount}%",
                    style: AppTextStyles.discount,
                  ),
                ),
              ),
            ],
          ),
          AppDimens.medium.height,
          Visibility(
              visible: now.isBefore(expiration),
              child: Container(
                width: double.infinity,
                height: 2,
                color: Colors.blue,
              )),
          AppDimens.small.height,
          Visibility(
              visible: now.isBefore(expiration),
              child: Text(
                formatTime(inSeconds),
                style: AppTextStyles.productTimer,
              ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const onSec = Duration(seconds: 1);
    _timer = Timer.periodic(onSec, (timer) {
      setState(() {
        if (inSeconds == 0) {
        } else {
          inSeconds--;
        }
      });
    });
  }
}
