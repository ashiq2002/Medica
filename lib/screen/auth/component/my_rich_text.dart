import 'package:flutter/material.dart';

class MyRichText extends StatelessWidget {
  final String text;
  final String linkText;
  final VoidCallback onTap;

  const MyRichText(
      {Key? key,
      required this.text,
      required this.linkText,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,
            style: TextStyle(color: Colors.grey[500])),
        GestureDetector(
          onTap: onTap,
          child: Text('  $linkText',
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
        )
      ],
    );
  }
}
