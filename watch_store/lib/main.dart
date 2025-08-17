import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';
import 'package:watch_store/routing/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SizeConfigInit(
      referenceHeight: 900,
      referenceWidth: 360,
      builder: (context, orientation) {
        return MaterialApp.router(
          title: 'Watch Store',
          routerConfig: routs,
          // home:  RegisterScreen(),
        );
      },
    );
  }
}





