import 'package:flutter/material.dart';
import 'package:watch_store/component/button_style.dart';

class PrimaryButton extends StatelessWidget {
 final String label;
 final VoidCallback onPressed;
   PrimaryButton({
    required this.label, 
    required this.onPressed,
    super.key});

  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.7,
      child: ElevatedButton(
        onPressed: onPressed,
        style: AppButtonStyle.primaryButtonStyle,
        child:  Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    ) ;
  }
}