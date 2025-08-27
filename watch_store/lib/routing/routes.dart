import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_store/core/widgets/main_wrapper.dart';
import 'package:watch_store/feature/presentation/auth/cubit/auth_cubit.dart';
import 'package:watch_store/feature/presentation/auth/screens/verify_code_screen.dart';
import 'package:watch_store/feature/presentation/auth/screens/register_screen.dart';
import 'package:watch_store/feature/presentation/auth/screens/send_sms_screen.dart';
import 'package:watch_store/feature/presentation/product/screens/cart_screen.dart';
import 'package:watch_store/feature/presentation/product/screens/product_single_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// کلاس کمکی برای تبدیل Stream به Listenable جهت refreshListenable
class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription _sub;
  GoRouterRefreshStream(Stream<dynamic> stream) {
    // روی هر تغییر state، notifyListeners فراخوانی می‌شود
    _sub = stream.asBroadcastStream().listen((_) => notifyListeners());
  }
  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}

GoRouter createRouter(AuthCubit authCubit) {
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: "/sendsms",
    routes: [
      GoRoute(
          path: '/verifycode',
          name: "/verifycode",
          builder: (context, state) {
            final data =
                state.extra as Map<String, dynamic>?; // ممکنه null باشه
            final mobile = data?["mobile"];

            return VerifyCodeScreen(mobile: mobile);
          }),
      GoRoute(
        path: '/sendsms',
        name: "/sendsms",
        builder: (context, state) => SendSmsScreen(),
      ),
      GoRoute(
        path: '/Register',
        name: "/Register",
        builder: (context, state) {
         
          return RegisterScreen();
        },
      ),
      GoRoute(
        path: '/mainwrapper',
        name: "/mainwrapper",
        builder: (context, state) => const MainWrapper(),
      ),
      GoRoute(
        path: '/productsinglescreen',
        name: "productsinglescreen",
        builder: (context, state) => const ProductSingleScreen(),
      ),
      GoRoute(
        path: '/cartscreen',
        name: "cartscreen",
        builder: (context, state) => const CartScreen(),
      ),
    ],
    redirect: (context, state) {
      final authState = authCubit.state;

      // اگر در حال لودینگ باشه هیچ مسیری تغییر نکنه
      if (authState is AuthLoadingState)
        return null;

      // اگر لاگین نشده باشه و الان توی صفحه Register نیست → بفرست Register
      else if (authState is LoggedOutState && state.fullPath != '/Register') {
        return '/sendsms';
      }

      // اگر لاگین شده باشه و جایی غیر از mainwrapper باشه → بفرست mainwrapper
      else if (authState is LoggedInState && state.fullPath != '/mainwrapper') {
        return '/mainwrapper';
      } else {
        return null;
      } // هیچ تغییری در مسیر نده
    },
    // گوش دادن به تغییرات cubit برای اجرای دوباره redirect
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
  );
}
