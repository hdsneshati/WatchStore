import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:size_config/size_config.dart';
import 'package:watch_store/assets/svg_path.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/feature/presentation/product/widgets/shopping_cart_item.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '  سبد خرید',
                    style: AppTextStyles.productTitle,
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            )),
        body: Column(
          children: [
            10.0.verticalSpace,
            AddToAddress(),
            ListShopping(),
              Container(
            
            decoration: BoxDecoration(
             color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, -3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                     '122000  تومان',
                     textDirection: TextDirection.ltr,
                     style: AppTextStyles.oldPriceStyle.copyWith(fontSize: 15.sp),
                   ),
                ),
                Container(
                  margin: const EdgeInsets.all(AppDimens.medium),
                  padding: const EdgeInsets.all(AppDimens.medium),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(AppDimens.small),
                  ),
                  child: const Text(
                    " ادامه فرایند خرید  ",
                    style: AppTextStyles.tagTitle,
                  ),
                ),
              ],
            ),
          
        ),
     
          ],
        ),
      ),
    );
  }
}

class ListShopping extends StatelessWidget {
  const ListShopping({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: ((context, index) {
            return ShoppingCartItem(
              productTitle: 'ساعت',
              price: 4000,
              oldPrice: 10000,
              discount: 30,
            );
          })),
    );
  }
}

class AddToAddress extends StatelessWidget {
  const AddToAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.all(AppDimens.medium),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset(SvgPath.laftArrow)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.sendToAddress,
                  style: AppTextStyles.caption,
                  softWrap: true,
                ),
                FittedBox(
                  child: Text(
                    AppStrings.lurem,
                    style: AppTextStyles.caption.copyWith(color: Colors.black),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
