import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/core/widgets/primary_button.dart';
import 'package:watch_store/feature/presentation/auth/cubit/auth_cubit.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/core/widgets/app_text_feild.dart';

class VerifyCodeScreen extends StatefulWidget {
  VerifyCodeScreen({required this.mobile, super.key});
  final String mobile;

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController controller = TextEditingController();


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }


  late Timer timer;
  int _start = 10;

  startTimer() {
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (timer) {
     setState(() {
        if (_start == 0) {
        timer.cancel();
        context.pop();
      } else {
        _start--;
      }
     });
     
    });
  }
  String formatTime(int sec){
    int min = sec ~/60;
     int seconds = sec % 60;
     String minStr = min.toString().padLeft(2,"0");
     String secondsStr = seconds.toString().padLeft(2,"0");
     return '$minStr:$secondsStr';
  }
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
                .replaceAll(AppStrings.replace, widget.mobile)),
            AppDimens.small.verticalSpace,
            GestureDetector(
              onTap: () {
                timer.cancel();
                context.pop();
              },
              child: const Text(
                AppStrings.wrongNumberEditNumber,
                style: AppTextStyles.primaryThemeTextStyle,
              ),
            ),
            AppDimens.large.verticalSpace,
            AppTextFeild(
              lable: AppStrings.enterVerificationCode,
              hint: AppStrings.hintVerificationCode,
              //  icon:Image.asset('assets/svg/avatar.svg'),
              //  inputType: TextInputType.phone,
              prefixlabel: formatTime(_start),
              controller: controller,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthVerifyIsRegisterState) {
                  timer.cancel();
                  context.pushNamed("/mainwrapper");
                } else if (state is AuthVerifyState) {
                  timer.cancel();
                  context.pushNamed("/Register");
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return PrimaryButton(
                      label: AppStrings.next,
                      onPressed: () {
                        timer.cancel();
                        BlocProvider.of<AuthCubit>(context)
                            .verifyCode(widget.mobile, controller.text);

                        //  context.pushNamed("/mainwrapper");
                        // Handle button press
                      });
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
