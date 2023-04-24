import 'package:flutter/material.dart';
import 'package:medica/constent/app_colors.dart';

class RememberMe extends StatelessWidget {
  final String text;
  const RememberMe({Key? key, this.text = 'Remember me'}) : super(key: key);

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
                  color: Color(AppColors.buttonPrimary), width: 2),
              activeColor: const Color(AppColors.buttonPrimary),
              value: false,
              onChanged: (isChecked) {}),
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
