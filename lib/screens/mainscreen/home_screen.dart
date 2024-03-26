import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppDimens.medium),
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
            )
          ],
        ),
      )
    ));
  }
}
