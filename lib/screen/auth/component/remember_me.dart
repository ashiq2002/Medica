import 'package:flutter/material.dart';
import 'package:medica/res/theme/app_colors.dart';

class RememberMe extends StatelessWidget {
  final String text;
  final void Function(bool?)? onChanged;
  final bool isChecked;
  const RememberMe(
      {Key? key,
      this.text = 'Remember me',
      this.onChanged,
      required this.isChecked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //check box
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              side: const BorderSide(
                  color: Color(AppColors.primaryColor), width: 2),
              activeColor: const Color(AppColors.primaryColor),
              value: isChecked,
              onChanged: (value)=>onChanged!(value)),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
        )
      ],
    );
  }
}
