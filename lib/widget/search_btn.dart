import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../component/text_style.dart';
import '../gen/assets.gen.dart';
import '../res/colors.dart';
import '../res/dimens.dart';
import '../res/strings.dart';

class SearchBtn extends StatelessWidget {
  const SearchBtn({
    super.key,
    required this.onTap
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.medium),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 55,
          width:double.infinity,
          decoration: BoxDecoration(
              color: AppColors.searchBar,
              borderRadius: BorderRadius.circular(60),
              boxShadow: const [
                BoxShadow(
                    color: AppColors.shadow,
                    offset: Offset(0,2),
                    blurRadius: 3
                )
              ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(Assets.svg.search.path),
              const Text(AppStrings.searchProduct,style: AppTextStyles.searchHint,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Assets.png.mainLogo.path),
              )
            ],
          ),
        ),
      ),
    );
  }
}
