import 'package:flutter/material.dart';
import 'package:medica/res/theme/app_colors.dart';

enum FieldType { email, password }

class MyFormField extends StatelessWidget {
  final IconData? prefixIcon;
  final int iconColor;
  final String hintText;
  final FieldType? fieldType;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final bool obscure;

  const MyFormField(
      {Key? key,
      this.prefixIcon,
      required this.hintText,
      this.iconColor = AppColors.iconColor,
      this.fieldType,
      this.controller,
      this.onChanged,
      this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      this.suffixIcon,
      this.onTap,
      this.obscure = false, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          fillColor: const Color(AppColors.fillColor),
          filled: true,
          prefixIcon: Icon(
            prefixIcon,
            color: Color(iconColor),
          ),
          prefixIconConstraints:
              prefixIcon == null ? const BoxConstraints(minWidth: 2) : null,
          suffixIcon: GestureDetector(
              onTap: onTap,
              child: Icon(
                fieldType != FieldType.password
                    ? suffixIcon
                    : obscure
                        ? Icons.visibility_off
                        : Icons.visibility,
                color: Color(iconColor),
              )),
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
        onChanged: (value)=>onChanged??(value),
        validator: (value)=>validator!(value),
      ),
    );
  }
}
