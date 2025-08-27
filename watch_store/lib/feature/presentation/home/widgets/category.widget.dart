import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:size_config/size_config.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/res/dimens.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    required this.title,
    required this.imagePath,  
    required this.onTap,
   required this.color1 ,
   required this.color2 ,
    super.key,
  });
   final String title;
    final String imagePath; 
    final VoidCallback onTap;
    final Color color1;
    final Color color2;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(AppDimens.small) ,
            width: 61.w ,
            height: 61.h,
            decoration: BoxDecoration(
             gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
                colors: [
                  color1,
                  color2,
                 
                ],
              ),
              borderRadius: BorderRadius.circular(AppDimens.large),
            ),
            child: SizedBox(
              height: 49.h,
              child: SvgPicture.asset(
                imagePath,
              ),
            ),
          ),
          Text(title,
              style: AppTextStyles.title.copyWith(fontSize: 16.sp),
            ),
        ],
      ),
    );
  }
}
