import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/assets/svg_path.dart';
import 'package:watch_store/core/widgets/cart_badge.dart';
import 'package:watch_store/features/home/Screens/homescreen.dart';
import 'package:watch_store/features/product/screens/productscreen.dart';
import 'package:watch_store/features/profile/profilescreen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key, this.startIndex});
  final int? startIndex;
  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int index = 0;
  final List<int> _routeHistory = [0];
  List<Widget> screens = [
    const HomeScreen(),
    const ProductScreen(),
    const ProfileScreen(),
  ];
  List<String> appBarTitles = [
    "خانه",
    "سبد خرید",
    "پروفایل",
  ];

  @override
  void initState() {
    if (widget.startIndex != null) {
      index = widget.startIndex!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // از بستن مستقیم جلوگیری می‌کنیم
      onPopInvokedWithResult: (context, result) {
        print(_routeHistory.length);

        if (_routeHistory.length >= 1) {
          print(_routeHistory.first);
          setState(() {
            _routeHistory.removeLast();
            print(_routeHistory.length);
            index = _routeHistory.last;
          });
        } else {
          // اگه هیستوری خالی شد → اپ بسته بشه
        }
      },
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          elevation: 10,
          shadowColor: const Color.fromARGB(255, 206, 201, 201),
          indicatorColor: const Color.fromARGB(255, 219, 221, 222),
          selectedIndex: index,
          onDestinationSelected: (value) {
            setState(() {
              index = value;
              _routeHistory.add(index);
            });
          },
          destinations: <Widget>[
            NavigationDestination(
              icon: SvgPicture.asset(
                SvgPath.home,
                colorFilter:
                    const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                SvgPath.home,
                colorFilter:
                    const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
              label: 'خانه',
            ),
            NavigationDestination(
              icon: CartBadge(
                count: 5,
                colorfilter:
                    const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              selectedIcon: CartBadge(
                count: 5,
                colorfilter:
                    const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
              label: 'سبد خرید',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                SvgPath.avatar,
                colorFilter:
                    const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                SvgPath.avatar,
                colorFilter:
                    const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
              label: 'پروفایل',
            ),
          ],
        ),
        body: screens[index],
      ),
    );
  }

  btmNavOnPress(int index) {
    setState(() {
      this.index = index;
      _routeHistory.add(index);
    });
  }
}
