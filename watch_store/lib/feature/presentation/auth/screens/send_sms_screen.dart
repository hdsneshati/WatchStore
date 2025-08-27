import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/core/widgets/primary_button.dart';
import 'package:watch_store/feature/presentation/auth/cubit/auth_cubit.dart';
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
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //   (size.height*0.2).verticalSpace,
            Image.asset('assets/png/main_logo.png'),
            AppDimens.large.verticalSpace,
            AppTextFeild(
              lable: AppStrings.enterYourNumber,
              hint: AppStrings.hintPhoneNumber,
              //  icon:Image.asset('assets/svg/avatar.svg'),
              //  inputType: TextInputType.phone,
              controller: controller,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSendState) {
                  context.pushNamed("/verifycode", extra: {"mobile": controller.text});
                } else if (state is AuthErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                    duration: Duration(microseconds: 800),
                    backgroundColor: Colors.red,
                    content: Text('شماره ارسال نشد'),
                  ));
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return PrimaryButton(
                    label: AppStrings.next,
                    onPressed: () {
                       BlocProvider.of<AuthCubit>(context).sendSms(controller.text);
                      //context.pushNamed("/Register");
                    });
              },
            ),
          ],
        ),
      )),
    );
  }
}
