import 'package:flutter/material.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/res/dimens.dart';

class AppTextFeild extends StatelessWidget {
  final String lable;
  final String prefixlabel;
  final String hint;
 final TextEditingController controller;
  final TextAlign textAlign;
 final Widget icon;
 final TextInputType? inputType;
 
 const  AppTextFeild({
     this.prefixlabel = '', 
    required this.lable, 
    required this.hint, 
    required this.controller, 
       this.textAlign = TextAlign.center,
     this.icon =const SizedBox(), 
     this.inputType,
    super.key});

  @override
  Widget build(BuildContext context) {
       Size size = MediaQuery.of(context).size;

    return Padding(
      padding:const EdgeInsets.all(AppDimens.medium),
      child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
         children: [
          SizedBox(
                        width:size.width*0.7 ,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(prefixlabel,style: AppTextStyles.title,),
                Text(lable,style: AppTextStyles.title,),
              ],
            ),
          ),
          AppDimens.small.verticalSpace,
          SizedBox(
           
            width:size.width*0.7 ,
            child: TextField(
              textAlign: textAlign,
              controller: controller,
              keyboardType: inputType,
              decoration: InputDecoration(
             //   hintStyle: AppTextStyles.hint,
                hintText: hint,
                prefixIcon: icon,
              ),
            ),
          ) 
         ],
        )
    );
  }
}