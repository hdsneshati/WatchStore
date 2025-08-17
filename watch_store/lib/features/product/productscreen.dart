import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Product Screen'),
      ),
      body: Center(
        child: Text(
          'Details of the selected product will be displayed here.',
         // style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}