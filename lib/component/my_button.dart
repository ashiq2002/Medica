import 'package:flutter/material.dart';
import 'package:medica/constent/app_colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final int color;

  const MyButton(
      {Key? key, required this.text, required this.onTap, this.color = AppColors.buttonPrimary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(color),
          minimumSize: Size(size.width / 1.2, 55),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: 1),
      ),
    );
  }
}
