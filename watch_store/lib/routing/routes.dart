
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_store/core/widgets/main_wrapper.dart';
import 'package:watch_store/features/auth/get_otp_screen.dart';
import 'package:watch_store/features/auth/register_screen.dart';
import 'package:watch_store/features/auth/send_otp_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter routs =
    GoRouter(navigatorKey: navigatorKey, initialLocation: "/Register", routes: [
  GoRoute(
    path: '/getotp',
    name: "/getotp",
    builder: (context, state) =>  GetOtpScreen(),
  ),
   GoRoute(
    path: '/sendotp',
    name: "/sendotp",
    builder: (context, state) =>  SendOtpScreen(),
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
 
]);
