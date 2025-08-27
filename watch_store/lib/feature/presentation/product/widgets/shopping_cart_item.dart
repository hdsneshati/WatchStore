import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/assets/svg_path.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/core/widgets/surface_container.dart';
import 'package:watch_store/res/colors.dart';

class ShoppingCartItem extends StatelessWidget {
   ShoppingCartItem({
    super.key,
    
    required this.discount,
    required this.oldPrice,
    required this.price,
    required this.productTitle,

  });
  final String productTitle;
  final int price;
  final int discount;
  final int oldPrice;

  int count=0;
  @override
  Widget build(BuildContext context) {
    return SurfaceContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                 productTitle,
                  style: AppTextStyles.productTitle.copyWith(fontSize: 12),
                ),
                Text(
                  '  قیمت: ${price.separateWithComma}تومان',
                  style: AppTextStyles.productTitle,
                ),
                Text(
                  '  باتخفیف: ${oldPrice.separateWithComma}تومان',
                  style: AppTextStyles.caption
                      .copyWith(color: AppColors.primaryColor),
                ),
                Divider(),
                Row(
                  children: [
                    IconButton(
                      onPressed: (){},
                       icon:  SvgPicture.asset(
                      SvgPath.delete,
                    )
                    ),
                    Expanded(child: SizedBox()),
                    IconButton(
                      onPressed: (){},
                       icon:  SvgPicture.asset(
                      SvgPath.minus,
                    )
                    ),
                    Text(' عدد $count' ),
                    IconButton(
                      onPressed: (){},
                       icon:  SvgPicture.asset(
                      SvgPath.plus,
                    )
                    ),
                  ],
                )
              ],
            ),
          ),
          Image.asset('assets/png/unnamed.png'),
        ],
      ),
    );
  }
}
