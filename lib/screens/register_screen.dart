import 'package:flutter/material.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widget/app_text_field.dart';
import 'package:watch_store/widget/avatar.dart';
import 'package:watch_store/widget/main_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppDimens.large.height,
              const Avatar(),
              AppDimens.large.height,
              AppTextField(
                  lable: AppStrings.nameLastName,
                  hint: AppStrings.hintNameLastName,
                  controller: _controller),
              AppTextField(
                  lable: AppStrings.homeNumber,
                  hint: AppStrings.hintHomeNumber,
                  controller: _controller),
              AppTextField(
                  lable: AppStrings.address,
                  hint: AppStrings.hintAddress,
                  controller: _controller),
              AppTextField(
                  lable: AppStrings.postalCode,
                  hint: AppStrings.hintPostalCode,
                  controller: _controller),
              AppTextField(
                  lable: AppStrings.location,
                  hint: AppStrings.hintLocation,
                  icon: const Icon(Icons.add_location_outlined,size: 30,),
                  controller: _controller),
              AppDimens.large.height,
              MainButton(text: AppStrings.register, onPressed: () {},),
              70.height,
            ],
          ),
        ),
      ),
    ));
  }
}
