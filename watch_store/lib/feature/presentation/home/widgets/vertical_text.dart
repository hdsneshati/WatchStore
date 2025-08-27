import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/assets/svg_path.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/res/dimens.dart';

class VerticalText extends StatelessWidget {
  const VerticalText({super.key});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Column(
        children: [
          Row(
            children: [
              Transform.rotate(angle: 1.5),
             SvgPicture.asset(
                SvgPath.verticalIcon,
                
              ),
              AppDimens.medium.horizontalSpace,
            const  Text('مشاهده همه',
                  
              ),
            ],
          ),
         const Text('شگفت انگیز',
          style: AppTextStyles.amazingStyle,),
      
        ],
      ),
    );
  }
}