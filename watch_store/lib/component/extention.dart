import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension EmptySpaceExtention on double {
  SizedBox get verticalSpace => SizedBox(
        height: toDouble(),
      );
  SizedBox get horizontalSpace => SizedBox(
        width: toDouble(),
      );
}//سه رقم جدا میکنه
extension IntExtention on int {
  String get separateWithComma {
    final numberFormat = NumberFormat.decimalPattern();
    return numberFormat.format(this);
  }
}