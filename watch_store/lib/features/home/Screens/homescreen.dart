import 'package:flutter/material.dart';
import 'package:watch_store/assets/svg_path.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/features/home/widgets/app_slider.dart';
import 'package:watch_store/features/home/widgets/category.widget.dart';
import 'package:watch_store/features/home/widgets/amazing_product.dart';
import 'package:watch_store/features/home/widgets/searchbar.widget.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBarHome(
                onTap: () {
                  // Define the action when the search bar is tapped
                  print('Search bar tapped');
                },
              ),
              const AppSliderHome(
                images: [],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryWidget(
                    title: AppStrings.classic,
                    onTap: () {},
                    color1: AppColors.catClasicColors[0],
                    color2: AppColors.catClasicColors[1],
                    imagePath: SvgPath.clasic,
                  ),
                  CategoryWidget(
                    title: AppStrings.smart,
                    onTap: () {},
                    color1: AppColors.catSmartColors[0],
                    color2: AppColors.catSmartColors[1],
                    imagePath: SvgPath.smart,
                  ),
                  CategoryWidget(
                    title: AppStrings.digital,
                    onTap: () {},
                    color1: AppColors.catDigitalColors[0],
                    color2: AppColors.catDigitalColors[1],
                    imagePath: SvgPath.digital,
                  ),
                  CategoryWidget(
                    title: AppStrings.desktop,
                    onTap: () {},
                    color1: AppColors.catDesktopColors[0],
                    color2: AppColors.catDesktopColors[1],
                    imagePath: SvgPath.desktop,
                  ),
                ],
              ),             
              AppDimens.large.verticalSpace,
            const  AmazingScrollerProduct(),
               
            ],
          ),
        ),
      ),
    );
  }
}


