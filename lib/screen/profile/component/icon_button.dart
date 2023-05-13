import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final String iconPath;
  final String text;
  final void Function()? onTap;
  const MyIconButton({Key? key, required this.iconPath, this.onTap, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            height: 45,
              width: 45,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.greenAccent.withOpacity(0.5),),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Image.asset(iconPath, height: 40, width: 40,)
          ),
          Text(text, textAlign: TextAlign.center, style: TextStyle(color: Colors.white.withOpacity(0.5)),)
        ],
      ),
    );
  }
}
