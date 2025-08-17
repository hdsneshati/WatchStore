import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';

class SearchBarHome extends StatelessWidget {
 final VoidCallback onTap;
  const SearchBarHome({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: 52,
        width: double.infinity,
        padding:
            const EdgeInsets.symmetric(horizontal: AppDimens.medium),
       margin: const EdgeInsets.all(AppDimens.medium) ,
        decoration: BoxDecoration(
          color: AppColors.appbar,
          borderRadius: BorderRadius.circular(60),
          boxShadow:const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 4,
              offset:  Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
      
          children: [
          SvgPicture.asset(
            'assets/svg/search.svg',
            width: 24,
            height: 24,
          ),
       const   Text(AppStrings.searchProduct,
              style: AppTextStyles.hint,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset('assets/png/main_logo.png', ),
              ),
        ],),
      ),
    );
  }
}
