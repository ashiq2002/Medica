import 'package:flutter/material.dart';

class SocialMediaTile extends StatelessWidget {
  final double width;
  final double height;
  final double iconWidth;
  final double iconHeight;
  final String text;
  final String iconPath;
  final VoidCallback onTap;

  const SocialMediaTile(
      {Key? key,
      required this.width,
      this.height = 60,
      this.iconWidth = 28,
      this.iconHeight = 28,
      this.text = '',
      required this.iconPath,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.withOpacity(0.3))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: iconHeight,
              width: iconWidth,
            ),
            text.trim().isNotEmpty
                ? const SizedBox(
                    width: 10,
                  )
                : const SizedBox(),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: 1),
            )
          ],
        ),
      ),
    );
  }
}
