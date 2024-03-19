import 'package:flutter/material.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widget/app_text_field.dart';
import 'package:watch_store/widget/main_button.dart';

class GetOtpScreen extends StatelessWidget {
  GetOtpScreen({super.key});

  final TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            Text(AppStrings.otpCodeSendFor.replaceAll(AppStrings.replace, "092236576531")),
            AppDimens.small.height,
            const Text(AppStrings.wrongNumberEditNumber),
            AppDimens.large.height,
            AppTextField(lable: AppStrings.enterVerificationCode,pefixLable: "2:54", hint: AppStrings.hintVerificationCode, controller: _controller),
            MainButton(text: AppStrings.next, onPressed: () {},)
          ],
        ),
      ),
    ));
  }
}
