import 'package:flutter/material.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/res/dimens.dart';

class AppTextField extends StatelessWidget {
  final String lable;
  final String pefixLable;
  final String hint;
  final TextAlign align;
  final TextEditingController controller;
  final Widget icon;
  final TextInputType? inputType;

  const AppTextField(
      {super.key,
      required this.lable,
      required this.hint,
      required this.controller,
      this.icon = const SizedBox.shrink(),
      this.pefixLable = "",
      this.inputType,
      required this.align});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
        padding: const EdgeInsets.all(AppDimens.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: size.width * .75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pefixLable,
                    style: AppTextStyles.textFieldLabel,
                  ),
                  Text(
                    lable,
                    style: AppTextStyles.textFieldLabel,
                  ),
                ],
              ),
            ),
            AppDimens.small.height,
            SizedBox(
              height: size.height * .065,
              width: size.width * .75,
              child: TextField(
                style: AppTextStyles.textFieldStyle,
                textAlign: align,
                controller: controller,
                keyboardType: inputType,
                decoration: InputDecoration(
                  hintStyle: AppTextStyles.textFieldHint,
                  hintText: hint,
                  prefixIcon: icon,
                ),
              ),
            ),
          ],
        ));
  }
}
