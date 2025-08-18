import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/assets/svg_path.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/features/product/widgets/cart_badge.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, size.height * .1),
            child: Container(
              padding:const EdgeInsets.symmetric(horizontal: AppDimens.medium),
              // margin: EdgeInsets.symmetric(horizontal: AppDimens.small),
              height: size.height * .06,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:const BorderRadius.only(
                  bottomLeft: Radius.circular(AppDimens.medium),
                  bottomRight: Radius.circular(AppDimens.medium),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               const    CartBadge(
              count: 5, // Example count for the badge
            ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   const   Text(
                        'پرفروش ترین',
                        style: AppTextStyles.title,
                      ),
                      AppDimens.small.horizontalSpace,
                      SvgPicture.asset(
                        SvgPath.sort,
                        width: AppDimens.large,
                        height: AppDimens.large,
                       colorFilter:const ColorFilter.mode(
            Colors.black,
            BlendMode.srcIn,
          ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    SvgPath.close,
                    width: AppDimens.medium,
                    height: AppDimens.medium,
                    colorFilter:const ColorFilter.mode(
            Colors.black,
            BlendMode.srcIn,
          ),
                  )
                ],
              ),
            )),
        body: Column(
          children: [
            50.0.verticalSpace,
           
            const Center(
              child: Text(
                'Details of the selected product will be displayed here.',
                // style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




/*class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
   required this.child,
    super.key});
   final Widget child;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: child,
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}*/
