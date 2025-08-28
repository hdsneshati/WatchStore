import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:size_config/size_config.dart';
import 'package:watch_store/feature/presentation/auth/cubit/auth_cubit.dart';
import 'package:watch_store/routing/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/utils/shared_preferences_manager.dart';
void main() async{
 WidgetsFlutterBinding.ensureInitialized();//اصول اینیشیالایز شدن
 await SharedPreferencesManager().init();
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
        return BlocProvider(
          create: (context) => AuthCubit(),
           child: Builder(
            builder: (context) {
              final authCubit = context.read<AuthCubit>();
              final router = createRouter(authCubit);

          return MaterialApp.router(
            title: 'Watch Store',
            routerConfig: router,
            // home:  RegisterScreen(),
          );
        } 
         ) 
         );
      },
    );
  }
}
