import 'package:flutter/material.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';

ThemeData lightTheme(){
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: Colors.black),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: MaterialStateColor.resolveWith((states) {
        if(states.contains(MaterialState.focused)){
          return AppColors.focusedTextField;
        }else{
          return AppColors.unFocusedTextField;
        }
      }),
      contentPadding: const EdgeInsets.all(Dimens.medium),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.medium),
        borderSide: const BorderSide(color: AppColors.borderColor)
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.medium),
        borderSide: const BorderSide(color: AppColors.focusedBorderColor)
      )
    )
  );
}