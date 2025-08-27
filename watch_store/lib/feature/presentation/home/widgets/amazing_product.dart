import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/feature/presentation/home/widgets/vertical_text.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';

class AmazingScrollerProduct extends StatelessWidget {
  const AmazingScrollerProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true,
      child: Row(
        children: [
          SizedBox(
            height: 300.h,
            child: ListView.builder(
              physics:
                  const ClampingScrollPhysics(), //برای جلوگیری از اسکرول شدن لیست میچسبه به سینگلچایلداسکرول
              itemCount: 8,
              itemExtent: 150.w, //ارتفاع هر آیتم
              padding: const EdgeInsets.all(AppDimens.medium),
              itemBuilder: (context, index) {
                return ProductItem(
                  productName: 'Product $index',
                  productImage: 'assets/png/unnamed.png',
                  productPrice: 160000,
                  productOldPrice: 1900000,
                  productDiscount: 20,
                 productTimer:22,
                 ontap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProductSingleScreen()));
                 },
                );
              },
              scrollDirection: Axis.horizontal, //عمودی کردن
    
              shrinkWrap: true,
            ),
          ),
       const   VerticalText(),
        ],
      ),
    );
  }
}


class ProductItem extends StatelessWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final int productOldPrice;
  final int productDiscount;
  final int productTimer;
  final VoidCallback ontap;
  const ProductItem({
    required this.ontap,
    required this.productName,
    required this.productImage, 
    required this.productPrice,
     this.productOldPrice = 0,
     this.productDiscount = 0,
     this.productTimer = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:ontap,
      child: Container(
        padding: const EdgeInsets.all(AppDimens.small),
        margin: const EdgeInsets.all(AppDimens.medium),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.productBgGradiant[0],
              AppColors.productBgGradiant[1],
            ],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ),
          borderRadius:
              BorderRadius.circular(AppDimens.medium.h),
        ),
        width: 200.w,
        child: Column(
          children: [
            Image.asset(
              productImage,
              width: 180.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                productName,
                style: AppTextStyles.productTitle,
              ),
            ),
            AppDimens.large.verticalSpace,
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
               Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' ${productPrice.separateWithComma } ',
                      style: AppTextStyles.title,
                    ),
                    Visibility(
                      visible: productOldPrice > 0?true:false,
                      child: Text(
                        '${productOldPrice.separateWithComma } ',
                        style: AppTextStyles.oldPriceStyle,
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: productDiscount > 0? true : false,
                  child: Container(
                    padding: const EdgeInsets.all(
                        AppDimens.small * 0.5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius:
                          BorderRadius.circular(40.h),
                    ),
                    child: Text(
                    ' $productDiscount%',
                      
                    ),
                  ),
                )
              ],
            ),
            Visibility(
              visible: productTimer != 0 ? true : false,
              child: Container(
                height: 2.h,
                width: double.infinity,
                color: AppColors.primaryColor,
              ),
            ),
            Visibility(
              visible: productTimer != 0 ? true : false,
              child: Text(
                '$productTimer',
                style: AppTextStyles.prodTimerStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
