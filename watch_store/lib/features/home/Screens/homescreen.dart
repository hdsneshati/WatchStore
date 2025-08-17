import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';
import 'package:watch_store/features/home/widgets/app_slider.dart';
import 'package:watch_store/features/home/widgets/searchbar.widget.dart';
import 'package:watch_store/res/dimens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBarHome(
                onTap: () {
                  // Define the action when the search bar is tapped
                  print('Search bar tapped');
                },
              ),
            const  AppSliderHome(images: [],),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(AppDimens.small) ,
                  width: 61.w ,
                  height: 61.h,
                  decoration: BoxDecoration(
                   gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                      colors: [
                        const Color.fromARGB(255, 255, 166, 114).withOpacity(0.5),
                        const Color.fromARGB(255, 255, 227, 200).withOpacity(0.5),
                       
                      ],
                    ),
                    borderRadius: BorderRadius.circular(AppDimens.large),
                  ),
                )
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}

