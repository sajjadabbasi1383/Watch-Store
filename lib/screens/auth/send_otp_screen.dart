import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/route_manager/screen_names.dart';
import 'package:watch_store/screens/auth/cubit/auth_cubit.dart';
import 'package:watch_store/widget/app_text_field.dart';
import 'package:watch_store/widget/main_button.dart';

import '../../component/text_style.dart';
import '../../widget/snack_bar.dart';

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
                inputType: TextInputType.phone,
                controller: _controller,
                align: TextAlign.center,
                errorText: 'لطفا شماره تلفن را وارد کنید',
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is SentState) {
                    Navigator.pushNamed(context, ScreenNames.verifyCodeScreen,
                        arguments: state.mobile);
                    showCustomSnackBar(
                        context,
                        "کد فعالسازی: ${state.code.toString()}",
                        80,
                        "successes");
                  } else if (state is ErrorState) {
                    showCustomSnackBar(
                        context, "خطا در اتصال به سرور", 5, "error");
                  }
                },
                builder: (context, state) {
                  return MainButton(
                    onPressed: state is LoadingState
                        ? null
                        : () {
                            BlocProvider.of<AuthCubit>(context)
                                .sendSms(_controller.text);

                          },
                    child: state is LoadingState
                        ? LoadingAnimationWidget.prograssiveDots(
                            color: Colors.white,
                            size: 38,
                          )
                        : const Text(
                            AppStrings.sendOtpCode,
                            style: AppTextStyles.mainButton,
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
