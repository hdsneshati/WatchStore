import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/assets/svg_path.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/core/widgets/app_bar.dart';
import 'package:watch_store/core/widgets/surface_container.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(AppStrings.profile, style: AppTextStyles.title),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.large),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppDimens.medium.verticalSpace,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      'assets/png/avatar.png',
                    ),
                  ),
                  AppDimens.medium.verticalSpace,
                  Text(
                    'حدیث نشاطی',
                    style: AppTextStyles.avatarText,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(SvgPath.laftArrow)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.activeAddress,
                              style: AppTextStyles.caption,
                              softWrap: true,
                            ),
                            FittedBox(
                              child: Text(
                                AppStrings.lurem,
                                style: AppTextStyles.caption
                                    .copyWith(color: Colors.black),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                 AppDimens.large.verticalSpace,
                 const Divider(
                  color: AppColors.surfaceColor,
                 ),
                 ItemProfile(
                  iconpath: SvgPath.user,
                  contant: '1254875',
                 ),
                  ItemProfile(
                  iconpath: SvgPath.cart,
                  contant: '1254875',
                 ),
                 
                  ItemProfile(
                  iconpath: SvgPath.phone,
                  contant: '1254875',
                 ),

                 SurfaceContainer(child: Text('قوانین'))
                ],
              ),
            ),
          ),
        ));
  }
}

class ItemProfile extends StatelessWidget {
  const ItemProfile({
    super.key,
    required this.contant,
    required this.iconpath,
  });
  final  iconpath;

 final String contant;
  @override
  Widget build(BuildContext context) {
    return Align(
     alignment: Alignment.centerRight,
      child: Row(
       children: [
         SvgPicture.asset(iconpath),
         Text(contant),
       ],
      ),
    );
  }
}
