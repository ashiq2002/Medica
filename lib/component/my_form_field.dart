import 'package:flutter/material.dart';
import 'package:medica/constent/app_colors.dart';

enum FieldType { email, password }

class MyFormField extends StatelessWidget {
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final int iconColor;
  final String hintText;
  final FieldType fieldType;
  final bool obscureText;

  const MyFormField(
      {Key? key,
      required this.prefixIcon,
      this.suffixIcon,
      required this.hintText,
      this.iconColor = AppColors.iconColor,
      required this.fieldType,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: const Color(AppColors.fillColor),
        filled: true,
        prefixIcon: Icon(
          prefixIcon,
          color: Color(iconColor),
        ),
        suffixIcon: Icon(
          suffixIcon,
          color: Color(iconColor),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(AppColors.hintColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color(AppColors.fillColor),
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color(AppColors.fillColor),
            )),
      ),
    );
  }
}
