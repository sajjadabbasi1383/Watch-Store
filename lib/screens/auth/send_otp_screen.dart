import 'package:flutter/material.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/route_manager/screen_names.dart';
import 'package:watch_store/widget/app_text_field.dart';
import 'package:watch_store/widget/main_button.dart';

class SendOtpScreen extends StatelessWidget {
  SendOtpScreen({super.key});

  final TextEditingController _controller = TextEditingController();

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
            AppTextField(
                lable: AppStrings.enterYourNumber,
                hint: AppStrings.hintPhoneNumber,
                controller: _controller,
                align: TextAlign.center),
            MainButton(
              text: AppStrings.sendOtpCode,
              onPressed: () => Navigator.pushNamed(context, ScreenNames.verifyCodeScreen),
            )
          ],
        ),
      ),
    ));
  }
}
