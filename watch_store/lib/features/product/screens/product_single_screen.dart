import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:size_config/size_config.dart';
import 'package:watch_store/assets/svg_path.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/core/widgets/cart_badge.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({super.key});

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
                const CartBadge(
                  count: 0,
                  colorfilter: ColorFilter.mode(Colors.black,
                      BlendMode.srcIn), // Example count for the badge
                ),
                const Expanded(
                  child: Text(
                    ' product name',
                    style: AppTextStyles.productTitle,
                    textDirection: TextDirection.rtl,
                  ),
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
      body: Stack(children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('635000 تومان',
                              style: AppTextStyles.productTitle),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                          padding: const EdgeInsets.symmetric(horizontal: 3)  ,
                            decoration:  BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30.h),
                            ),
                            child: const Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                '20%',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '122000 ',
                        textDirection: TextDirection.ltr,
                        style: AppTextStyles.oldPriceStyle.copyWith(fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(AppDimens.medium),
                  padding: const EdgeInsets.all(AppDimens.medium),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(AppDimens.small),
                  ),
                  child: const Text(
                    "افزودن به سبد خرید",
                    style: AppTextStyles.tagTitle,
                  ),
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(children: [
            Image.asset(
              'assets/png/unnamed.png',
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.all(AppDimens.medium),
              padding: const EdgeInsets.all(AppDimens.medium),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimens.medium),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'product name',
                    textDirection: TextDirection.rtl,
                    style: AppTextStyles.productTitle,
                  ),
                  Text(
                    '   caption caption caption caption caption caption ',
                    textDirection: TextDirection.rtl,
                    style: AppTextStyles.caption,
                  ),
                  const Divider(),
                  const ProductTabView(),
                  60.0.verticalSpace,
                ],
              ),
            ),
            80.0.verticalSpace,
          ]),
        ),
      ]),
    ));
  }
}

class ProductTabView extends StatefulWidget {
  const ProductTabView({super.key});

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {
  var selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 50,
        child: ListView.builder(
          itemExtent:
              MediaQuery.sizeOf(context).width / 3.5, //سه تا ایتم نشون بده
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.medium,
                  vertical: AppDimens.medium,
                ),
                child: Center(
                    child: Text(
                  tabs[index],
                  style: selectedIndex == index
                      ? AppTextStyles.selectedTab
                      : AppTextStyles.unSelectedTab,
                )),
              ),
            );
          },
        ),
      ),
      IndexedStack(
        index: selectedIndex,
        children: const [
          Review(),
          Comments(),
          Features(),
        ],
      )
    ]);
  }
}

List<String> tabs = [
  'نقد و بررسی',
  ' مشخصات ',
  ' خصوصیات ',
];

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        """
    لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم
    از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگ
    رها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که 
    است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای 
    با هدف  ابزارهای کاربردی می باشد. کتابهای  در شصت و س
    ه درصد  حال و آینده  فراوان جامعه و  را می طلبد ت
    ا با نرم  شناخت بیشتری را برای طراحان رایانه ای  
       
""",
        style: AppTextStyles.prodTimerStyle,
      ),
    );
  }
}

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("""
    لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم
    از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگ
    رها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که 
    است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای 
    با هدف  ابزارهای کاربردی می باشد. کتابهای  در شصت و س
    ه درصد  حال و آینده  فراوان جامعه و  را می طلبد ت
    ا با نرم  شناخت بیشتری را برای طراحان رایانه ای  
       
""", style: AppTextStyles.unSelectedTab),
    );
  }
}

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("""
    لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم
    از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگ
    رها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که 
    است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای 
    با هدف  ابزارهای کاربردی می باشد. کتابهای  در شصت و س
    ه درصد  حال و آینده  فراوان جامعه و  را می طلبد ت
    ا با نرم  شناخت بیشتری را برای طراحان رایانه ای  
       
""", style: AppTextStyles.amazingStyle),
    );
  }
}
