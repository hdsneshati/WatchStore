import 'package:flutter/material.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/screens/send_otp_screen.dart';

class PrimaryAvatar extends StatelessWidget {
  const PrimaryAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
       children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            'assets/png/avatar.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ) ,
        ),
        AppDimens.medium.verticalSpace,

       ], 
      );
    
  }
}