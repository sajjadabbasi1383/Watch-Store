import 'package:flutter/material.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/route_manager/screen_names.dart';
import 'package:watch_store/widget/app_text_field.dart';
import 'package:watch_store/widget/avatar.dart';
import 'package:watch_store/widget/main_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, size.height * .07),
        child: Container(
          height: size.height * .07,
          color: AppColors.appbar,
          child: Padding(
            padding: const EdgeInsets.only(
                left: AppDimens.medium, right: AppDimens.large),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 21,
                    )),
                const Text(
                  AppStrings.register,
                  style: AppTextStyles.appBarText,
                )
              ],
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppDimens.medium.height,
              const Avatar(),
              AppDimens.medium.height,
              AppTextField(
                lable: AppStrings.nameLastName,
                hint: AppStrings.hintNameLastName,
                controller: _controller,
                align: TextAlign.end,
              ),
              AppTextField(
                lable: AppStrings.homeNumber,
                hint: AppStrings.hintHomeNumber,
                controller: _controller,
                align: TextAlign.end,
              ),
              AppTextField(
                lable: AppStrings.address,
                hint: AppStrings.hintAddress,
                controller: _controller,
                align: TextAlign.end,
              ),
              AppTextField(
                lable: AppStrings.postalCode,
                hint: AppStrings.hintPostalCode,
                controller: _controller,
                align: TextAlign.end,
              ),
              AppTextField(
                lable: AppStrings.location,
                hint: AppStrings.hintLocation,
                icon: const Icon(
                  Icons.add_location_outlined,
                  size: 27,
                ),
                controller: _controller,
                align: TextAlign.end,
              ),
              AppDimens.small.height,
              MainButton(
                text: AppStrings.register,
                onPressed: () => Navigator.pushNamed(
                    context, ScreenNames.mainScreen),
              ),
              70.height,
            ],
          ),
        ),
      ),
    ));
  }
}
