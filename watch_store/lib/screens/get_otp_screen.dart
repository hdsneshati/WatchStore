import 'package:flutter/material.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/core/widgets/primary_button.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/core/widgets/app_text_feild.dart';

class GetOtpScreen extends StatelessWidget {
  GetOtpScreen({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (size.height * 0.2).verticalSpace,
            Image.asset('assets/png/main_logo.png'),
            AppDimens.large.verticalSpace,
            Text(AppStrings.otpCodeSendFor
                .replaceAll(AppStrings.replace, '09024365997')),
            AppDimens.small.verticalSpace,
            Text(AppStrings.wrongNumberEditNumber),
            AppDimens.large.verticalSpace,
            AppTextFeild(
              lable: AppStrings.enterVerificationCode,
              hint: AppStrings.hintVerificationCode,
              //  icon:Image.asset('assets/svg/avatar.svg'),
              //  inputType: TextInputType.phone,
              prefixlabel: '2:30',
              controller: controller,
            ),
            PrimaryButton(
                label: AppStrings.next,
                onPressed: () {
                  // Handle button press
                }),
          ],
        ),
      )),
    );
  }
}
