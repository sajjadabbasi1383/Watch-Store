import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/widget/surface_container.dart';

import '../../component/text_style.dart';
import '../../res/strings.dart';
import '../../widget/app_bar.dart';
import '../product_single_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
            child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            AppStrings.profile,
            style: AppTextStyles.appBarText,
          ),
        )),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.large),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppDimens.large.height,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: SvgPicture.asset(
                      Assets.svg.avatar.path,
                      height: 80,
                    ),
                  ),
                  AppDimens.small.height,
                  const Text(
                    "سجاد عباسی",
                    style: AppTextStyles.avatarText,
                  ),
                  AppDimens.large.height,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppStrings.activeAddress,
                      style: AppTextStyles.productCaption,
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(Assets.svg.leftArrow.path),
                          const Text(
                            AppStrings.fakeAddress,
                            textDirection: TextDirection.rtl,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                            style: AppTextStyles.selectedTab,
                          ),
                        ],
                      )),
                  const Divider(),
                  AppDimens.small.height,
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: AppDimens.small),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "5041721046965523",
                              textAlign: TextAlign.right,
                              style: AppTextStyles.selectedTab,
                            ),
                          ),
                          AppDimens.small.width,
                          SvgPicture.asset(
                            Assets.svg.postalCode.path,
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: AppDimens.small),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "09112223344",
                              textAlign: TextAlign.right,
                              style: AppTextStyles.selectedTab,
                            ),
                          ),
                          AppDimens.small.width,
                          SvgPicture.asset(
                            Assets.svg.phone.path,
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: AppDimens.small),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "سجاد عباسی",
                              textAlign: TextAlign.right,
                              style: AppTextStyles.selectedTab,
                            ),
                          ),
                          AppDimens.small.width,
                          SvgPicture.asset(
                            Assets.svg.userMenu.path,
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SurfaceContainer(
                      child: Text(
                    "قوانین و مقررات",
                    textAlign: TextAlign.right,
                    style: AppTextStyles.selectedTab,
                  )),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
