import 'package:flutter/material.dart';

import '../component/text_style.dart';
import '../res/dimens.dart';

class CatWidget extends StatelessWidget {
  const CatWidget(
      {super.key,
      required this.colors,
      required this.iconPath,
      required this.title,
      required this.onTap});

  final void Function() onTap;
  final String title;
  final String iconPath;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.all(AppDimens.small),
            width: size.height * .09,
            height: size.height * .09,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: colors),
                borderRadius: BorderRadius.circular(AppDimens.large)),
            child: Image.network(iconPath),
          ),
          Text(
            title,
            style: AppTextStyles.catTitle,
          )
        ],
      ),
    );
  }
}
