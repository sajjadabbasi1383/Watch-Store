import 'package:flutter/material.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/res/dimens.dart';

class AppTextField extends StatelessWidget {
  final String lable;
  final String pefixLable;
  final String hint;
  final TextEditingController controller;
  final Widget icon;
  final TextInputType? inputType;

  const AppTextField(
      {super.key,
      required this.lable,
      required this.hint,
      required this.controller,
      this.icon = const SizedBox.shrink(),
        this.pefixLable="",
      this.inputType});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.sizeOf(context);
    return Padding(padding: const EdgeInsets.all(AppDimens.medium),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: size.width*.75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(pefixLable),
              Text(lable),
            ],
          ),
        ),
        AppDimens.medium.height,
        SizedBox(
          height:size.height*.07,
          width: size.width*.75,
          child: TextField(
            textAlign: TextAlign.center,
            controller: controller,
            keyboardType: inputType,
            decoration: InputDecoration(
              hintText: hint,
              prefixIcon: icon
            ),
          ),
        ),
      ],
    )
    );
  }
}
