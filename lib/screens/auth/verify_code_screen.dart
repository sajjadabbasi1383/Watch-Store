import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/route_manager/screen_names.dart';
import 'package:watch_store/screens/auth/cubit/auth_cubit.dart';
import 'package:watch_store/widget/app_text_field.dart';
import 'package:watch_store/widget/main_button.dart';
import '../../widget/snack_bar.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  late Timer _timer;
  int _start = 120;

  startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _timer.cancel();
          Navigator.pop(context);
        } else {
          _start--;
        }
      });
    });
  }

  String formatTime(int sec) {
    int min = sec ~/ 60;
    int seconds = sec % 60;

    String minStr = min.toString().padLeft(2, "0");
    String secondsStr = seconds.toString().padLeft(2, "0");

    return '$minStr:$secondsStr';
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routArg = ModalRoute.of(context)!.settings.arguments as List<String>;
    final mobileRoutArg = routArg[0];
    final codeRoutArg = routArg[1];
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Form(
          key: _formKey,
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
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Text(
                  AppStrings.wrongNumberEditNumber,
                  style: AppTextStyles.primaryStyle,
                ),
              ),
              AppDimens.large.height,
              AppTextField(
                lable: AppStrings.enterVerificationCode,
                pefixLable: formatTime(_start),
                hint: AppStrings.hintVerificationCode,
                inputType: TextInputType.number,
                controller: _controller,
                align: TextAlign.center,
                inputFormatter: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                errorText: 'لطفا کد فعالسازی را وارد کنید',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      showCustomSnackBar(
                          context, "کد فعالسازی : $codeRoutArg", 80, "success");
                    },
                    child: const Text(
                      "دریافت مجدد کد فعالسازی",
                      style: AppTextStyles.primaryStyle,
                    ),
                  ),
                ),
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is VerifiedRegisterState) {
                    _timer.cancel();
                    Navigator.pushNamed(context, ScreenNames.registerScreen,
                        arguments: state.token);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  } else if (state is ErrorState) {
                    showCustomSnackBar(
                        context, "کد وارد شده اشتباه است", 5, "error");
                  }
                },
                builder: (context, state) {
                  return MainButton(
                    onPressed: state is LoadingState
                        ? null
                        : () {
                            _formKey.currentState!.validate()
                                ? BlocProvider.of<AuthCubit>(context)
                                    .verifyCode(mobileRoutArg, _controller.text)
                                : null;
                          },
                    child: state is LoadingState
                        ? LoadingAnimationWidget.prograssiveDots(
                            color: Colors.white,
                            size: 37,
                          )
                        : const Text(
                            AppStrings.next,
                            style: AppTextStyles.mainButton,
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
