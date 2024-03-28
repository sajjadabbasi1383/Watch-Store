

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension SizedBoxExtension on num{
  SizedBox get height =>SizedBox(height: toDouble(),);
  SizedBox get width =>SizedBox(width: toDouble(),);
}

extension IntExtension on int{
  String get separateWithComma{
    final numberFormat=NumberFormat.decimalPattern();
    return numberFormat.format(this);
  }
}