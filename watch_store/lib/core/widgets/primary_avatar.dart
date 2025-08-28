import 'dart:io';

import 'package:flutter/material.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';

class PrimaryAvatar extends StatelessWidget {
  PrimaryAvatar({required this.onTap, required this.file, super.key});
  final VoidCallback? onTap;
  final File file;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: size.width*.3,
        height: size.height*.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: file == null
                  ? Image.asset(
                      'assets/png/avatar.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : Image.file(file),
            ),
          ),
          AppDimens.medium.verticalSpace,
          const Text(
            AppStrings.chooseProfileImage,
            style: AppTextStyles.avatarText,
          )
        ],
      ),
    );
  }
}
