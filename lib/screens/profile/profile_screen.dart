import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/screens/profile/bloc/profile_bloc.dart';
import 'package:watch_store/screens/profile/order_list_screen.dart';
import 'package:watch_store/widget/surface_container.dart';

import '../../component/text_style.dart';
import '../../res/colors.dart';
import '../../res/strings.dart';
import '../../widget/app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(ProfileInit());
    super.initState();
  }

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
          ),
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          buildWhen: (previous, current) {
            if (current is ProfileSuccess ||
                current is ProfileLoading ||
                current is ProfileError) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            if (state is ProfileSuccess) {
              return SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppDimens.large),
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
                        Text(
                          state.profileModel.name!,
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
                        AppDimens.small.height,
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              state.profileModel.address!.address!,
                              textDirection: TextDirection.rtl,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                              style: AppTextStyles.selectedTab,
                            )),
                        const Divider(),
                        AppDimens.small.height,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppDimens.small),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    state.profileModel.mobile!,
                                    textAlign: TextAlign.right,
                                    style: AppTextStyles.selectedTab,
                                  ),
                                ),
                                AppDimens.small.width,
                                const Icon(
                                  CupertinoIcons.device_phone_portrait,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppDimens.small),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    state.profileModel.phone!,
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
                          padding: const EdgeInsets.symmetric(
                              vertical: AppDimens.small),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    state.profileModel.name!,
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
                        SurfaceContainer(
                          child: Padding(
                            padding: const EdgeInsets.all(AppDimens.medium),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OrderListScreen(),
                                      )),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                          Assets.svg.delivered.path),
                                      AppDimens.small.height,
                                      const Text(
                                        AppStrings.delivered,
                                        style: AppTextStyles.avatarText,
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    SvgPicture.asset(Assets.svg.cancelled.path),
                                    AppDimens.small.height,
                                    const Text(
                                      AppStrings.cancelled,
                                      style: AppTextStyles.avatarText,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    SvgPicture.asset(
                                        Assets.svg.inProccess.path),
                                    AppDimens.small.height,
                                    const Text(
                                      AppStrings.inProccess,
                                      style: AppTextStyles.avatarText,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is ProfileLoading) {
              return SizedBox(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.staggeredDotsWave(
                      color: AppColors.loadingColor,
                      size: 40,
                    ),
                    AppDimens.small.height,
                    const Text(
                      "در حال تکمیل اطلاعات...",
                      style: AppTextStyles.loadingText,
                      textDirection: TextDirection.rtl,
                    )
                  ],
                ),
              );
            } else if (state is ProfileError) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.error,
                    style: AppTextStyles.error,
                  ),
                  AppDimens.medium.width,
                  Icon(
                    CupertinoIcons.exclamationmark_circle,
                    color: Colors.red.shade400,
                  ),
                ],
              );
            } else {
              throw Exception("Invalid $state State");
            }
          },
        ),
      ),
    );
  }
}
