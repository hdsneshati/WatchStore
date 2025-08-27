import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/core/widgets/primary_button.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/core/widgets/app_text_feild.dart';

class SendSmsScreen extends StatelessWidget {
   SendSmsScreen({super.key});
   final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
   // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
       //   (size.height*0.2).verticalSpace,
             Image.asset('assets/png/main_logo.png'),
             AppDimens.large.verticalSpace,
             AppTextFeild(
              lable:AppStrings.enterYourNumber ,
              hint: AppStrings.hintPhoneNumber,
            //  icon:Image.asset('assets/svg/avatar.svg'),
            //  inputType: TextInputType.phone,
              controller: controller,
               
             ),
             PrimaryButton(
              label: AppStrings.next, 
              onPressed: (){
                 
                 context.pushNamed("/Register");
              }),
          ],
     
     
        ),
      )),
    );
  }
}