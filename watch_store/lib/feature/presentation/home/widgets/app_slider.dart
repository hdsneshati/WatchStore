
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AppSliderHome extends StatefulWidget {
 const AppSliderHome({
  required this.images ,
    super.key,
  });
  final List<String> images ;
  @override
  State<AppSliderHome> createState() => _AppSliderHomeState();
}

class _AppSliderHomeState extends State<AppSliderHome> {
  final List<String> images = [
    'assets/png/main_logo.png',
    'assets/png/avatar.png',
    'assets/png/unnamed.png',
  ];

  int _current = 0;

  //لیستی از ویجت ها برای اسلایدر
  //final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Center(
        child: Column(
          children: [
            CarouselSlider(
               // carouselController: _controller,
              options: CarouselOptions(
                height: 210,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index; // ✅ اینجا ایندکس رو میگیری
                  });
                },
              ),
              items: images.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Row(
                                mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: images.map((image) {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                              //_controller.animateToPage(1); // اینجا ایندکس رو میگیریم
                
                          
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding:const EdgeInsets.all(20.0),
                            margin: const EdgeInsets.symmetric(horizontal: 9.0),
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == images.indexOf(image)
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
