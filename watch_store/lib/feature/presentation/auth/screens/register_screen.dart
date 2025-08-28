import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/core/widgets/primary_avatar.dart';
import 'package:watch_store/core/widgets/primary_button.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/core/widgets/app_text_feild.dart';
import 'package:watch_store/utils/image_handler.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({
   
    super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
 final TextEditingController controllerNameLastName = TextEditingController();

final  TextEditingController controllerHomeNumber = TextEditingController();

 ImageHandler imageHandler =ImageHandler();

  @override
  Widget build(BuildContext context) {
       Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size(double.infinity,size.height*.1), child: Container(
          child: Row(children: [
            IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_back))
          ,const  Text(AppStrings.register,style: AppTextStyles.avatarText,)
            ],),
            
        )),
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppDimens.large.verticalSpace,
                    
                  PrimaryAvatar(
                onTap:() async{
                  await imageHandler.pickAndCropImage(source:  ImageSource.gallery).then((ValueKey){setState(() {
                    
                  });});
                } ,
                file: imageHandler.getImage!,
                      
                
               ),
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
                          icon:const Icon(Icons.location_on, ),                   
                      
                         ),
               
                     PrimaryButton(
                label: AppStrings.next, 
                onPressed: (){
                   context.pushNamed("/verifycode");

                }),
         
                          ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}