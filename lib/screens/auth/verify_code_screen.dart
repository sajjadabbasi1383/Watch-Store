import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/route_manager/screen_names.dart';
import 'package:watch_store/screens/auth/cubit/auth_cubit.dart';
import 'package:watch_store/widget/app_text_field.dart';
import 'package:watch_store/widget/main_button.dart';

import '../../res/colors.dart';
import '../../widget/snack_bar.dart';

class VerifyCodeScreen extends StatelessWidget {
  VerifyCodeScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mobileRoutArg = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.png.mainLogo.path),
            AppDimens.large.height,
            Text(
              AppStrings.otpCodeSendFor
                  .replaceAll(AppStrings.replace, mobileRoutArg),
              style: AppTextStyles.avatarText,
            ),
            AppDimens.small.height,
            const Text(
              AppStrings.wrongNumberEditNumber,
              style: AppTextStyles.primaryStyle,
            ),
            AppDimens.large.height,
            AppTextField(
              lable: AppStrings.enterVerificationCode,
              pefixLable: "2:54",
              hint: AppStrings.hintVerificationCode,
              inputType: TextInputType.number,
              controller: _controller,
              align: TextAlign.center,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is VerifiedIsRegisterState) {
                  Navigator.pushReplacementNamed(
                      context, ScreenNames.mainScreen);
                } else if (state is VerifiedNotRegisterState) {
                  Navigator.pushReplacementNamed(
                      context, ScreenNames.registerScreen);
                } else if (state is ErrorState) {
                  showCustomSnackBar(
                      context, "کد وارد شده اشتباه است", 5, "error");
                }
              },
              builder: (context, state) {
                if (state is LoadingState) {
                  return const SpinKitFadingCircle(
                    color: AppColors.loadingColor,
                    size: 40,
                  );
                } else {
                  return MainButton(
                    text: AppStrings.next,
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context)
                          .verifyCode(mobileRoutArg, _controller.text);
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    ));
  }
}
