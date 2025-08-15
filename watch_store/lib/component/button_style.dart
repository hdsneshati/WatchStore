import 'package:flutter/material.dart';
import 'package:watch_store/res/dimens.dart';

class AppButtonStyle {
  AppButtonStyle._();

  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimens.medium),
    ),
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
  );
}