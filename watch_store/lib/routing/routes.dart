
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_store/core/widgets/main_wrapper.dart';
import 'package:watch_store/features/auth/verify_code_screen.dart';
import 'package:watch_store/features/auth/register_screen.dart';
import 'package:watch_store/features/auth/send_sms_screen.dart';
import 'package:watch_store/features/product/screens/cart_screen.dart';
import 'package:watch_store/features/product/screens/product_single_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter routs =
    GoRouter(navigatorKey: navigatorKey, initialLocation: "/Register", routes: [
  GoRoute(
    path: '/verifycode',
    name: "/verifycode",
    builder: (context, state) =>  VerifyCodeScreen(),
  ),
   GoRoute(
    path: '/sendsms',
    name: "/sendsms",
    builder: (context, state) =>  SendSmsScreen(),
  ),
   GoRoute(
    path: '/Register',
    name: "/Register",
    builder: (context, state) =>  RegisterScreen(),
  ),
   GoRoute(
    path: '/mainwrapper',
    name: "/mainwrapper",
    builder: (context, state) =>const  MainWrapper(),
  ),
  GoRoute(
    path: '/productsinglescreen',
    name: "productsinglescreen",
    builder: (context, state) =>const  ProductSingleScreen(),
  ),
  GoRoute(
    path: '/cartscreen',
    name: "cartscreen",
    builder: (context, state) =>const  CartScreen(),
  ),
]);
