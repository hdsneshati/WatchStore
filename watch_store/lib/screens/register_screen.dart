import 'package:flutter/material.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/core/widgets/primary_avatar.dart';
import 'package:watch_store/core/widgets/primary_button.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/core/widgets/app_text_feild.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController controllerNameLastName = TextEditingController();
  TextEditingController controllerHomeNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppDimens.large.verticalSpace,
                  
                  PrimaryAvatar(),
               AppTextFeild(
                        lable:AppStrings.nameLastName ,
                        hint: AppStrings.hintNameLastName,
                        controller: controllerNameLastName,                   
                       ),
                        AppTextFeild(
                        lable:AppStrings.homeNumber ,
                        hint: AppStrings.hintHomeNumber,
                        controller: controllerHomeNumber,                   
                       ),
                
                 AppTextFeild(
                        lable:AppStrings.address ,
                        hint: AppStrings.hintAddress,
                        controller: controllerNameLastName,                   
                       ),
                
                   AppTextFeild(
                        lable:AppStrings.location ,
                        hint: AppStrings.hintLocation,
                        controller: controllerNameLastName,
                        icon: Icon(Icons.location_on, ),                   
                       ),
                   PrimaryButton(
              label: AppStrings.next, 
              onPressed: (){
                // Handle button press
              }),
       
                        ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}