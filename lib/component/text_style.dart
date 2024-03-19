import 'package:flutter/material.dart';
import 'package:watch_store/gen/fonts.gen.dart';
import 'package:watch_store/res/colors.dart';

class AppTextStyles{
  AppTextStyles._();

  static const TextStyle textFieldLabel=TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 11,
      fontWeight: FontWeight.w300,
      color: AppColors.title
  );


  static const TextStyle textFieldHint=TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 11,
    fontWeight: FontWeight.w300,
    color: AppColors.hint
  );

  static const TextStyle mainButton=TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppColors.mainButtonText
  );

  static const TextStyle primaryStyle=TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryColor
  );

  static const TextStyle avatarText=TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.title
  );



}