import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:size_config/size_config.dart';
import 'package:watch_store/assets/svg_path.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({
    this.ontap,
    this.colorfilter,
    this.count = 0, super.key});
  final int count;
  final VoidCallback? ontap;
  final colorfilter; // Example count for the badge
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:ontap,
      child: Stack(
        children: [
          SvgPicture.asset(
            SvgPath.product,
            colorFilter:colorfilter,
          ),
          Visibility(
            visible: count > 0 ? true : false,
            child: Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 17.w,
                height: 17.h,
                decoration:const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    '$count',
                    style:const TextStyle(
                      color: Colors.white,
                      
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
