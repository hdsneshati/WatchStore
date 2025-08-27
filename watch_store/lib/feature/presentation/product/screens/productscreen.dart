import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_store/assets/svg_path.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/core/widgets/cart_badge.dart';
import 'package:watch_store/feature/presentation/home/widgets/amazing_product.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
              // margin: EdgeInsets.symmetric(horizontal: AppDimens.small),
              height: size.height * .06,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
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
                   CartBadge(
                    ontap: () {
                      context.pushNamed("cartscreen");
                    },
                    count: 5,
                    colorfilter:  ColorFilter.mode(Colors.black,
                        BlendMode.srcIn), // Example count for the badge
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'پرفروش ترین',
                        style: AppTextStyles.title,
                      ),
                      AppDimens.small.horizontalSpace,
                      SvgPicture.asset(
                        SvgPath.sort,
                        width: AppDimens.large,
                        height: AppDimens.large,
                        colorFilter: const ColorFilter.mode(
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
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  )
                ],
              ),
            )),
        body:const Column(
          children: [
            TagList(),
            ProductGridView(),
          ],
        ),
      ),
    );
  }
}

class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimens.medium,
        ),
        child: SizedBox(
          height: 24,
          child: ListView.builder(
              reverse: true,
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: AppDimens.small),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.large,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(AppDimens.large),
                  ),
                  child:const  Center(
                      child: Text(
                    'new force',
                    style: AppTextStyles.tagTitle,
                  )),
                );
              }),
        ));
  }
}

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 0.8,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return ProductItem(
                productName: 'productName',
                productImage: 'assets/png/unnamed.png',
                productPrice: 100000,
                ontap: () {
                  context.pushNamed("productsinglescreen");
                },
              );
            }));
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
