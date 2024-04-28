import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../component/text_style.dart';
import '../res/dimens.dart';

class CatWidget extends StatelessWidget {
  const CatWidget({
    super.key,
    required this.colors,
    required this.iconPath,
    required this.title,
    required this.onTap
  });

  final void Function() onTap;
  final String title;
  final String iconPath;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
    return GestureDetector(
    onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(AppDimens.small),
            width: size.height*.08,
            height: size.height*.08,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: colors
                ),
                borderRadius: BorderRadius.circular(AppDimens.large)
            ),
            child: SvgPicture.asset(iconPath),
          ),
          Text(title,style: AppTextStyles.catTitle,)
        ],
      ),
    );
  }
}
