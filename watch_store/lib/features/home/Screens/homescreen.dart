import 'package:flutter/material.dart';
import 'package:watch_store/features/home/widgets/app_slider.dart';
import 'package:watch_store/features/home/widgets/searchbar.widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              AppSliderHome()
            ],
          ),
        ),
      ),
    );
  }
}

