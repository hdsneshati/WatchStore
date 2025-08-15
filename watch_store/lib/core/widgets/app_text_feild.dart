import 'package:flutter/material.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/res/dimens.dart';

class AppTextFeild extends StatelessWidget {
  final String lable;
   String prefixlabel;
  final String hint;
  TextEditingController controller;
  final TextAlign textAlign;
  Widget icon;
  TextInputType? inputType;
   AppTextFeild({
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
      padding:EdgeInsets.all(AppDimens.medium),
      child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
         children: [
          SizedBox(
                        width:size.width*0.7 ,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(prefixlabel),
                Text(lable),
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