import 'package:flutter/material.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/res/dimens.dart';

class AppTextField extends StatelessWidget {
  final String lable;
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
      this.inputType});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.sizeOf(context);
    return Padding(padding: EdgeInsets.all(Dimens.medium),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(lable),
        Dimens.medium.height,
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
