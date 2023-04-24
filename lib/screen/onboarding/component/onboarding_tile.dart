import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medica/component/my_button.dart';

class OnBoardingTile extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onTap;

  const OnBoardingTile(
      {Key? key,
      required this.title,
      required this.buttonText,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 2.6,
      width: size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //title
            Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.blue,
                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40,),
            //button
            MyButton(text: buttonText, onTap: onTap),
            const SizedBox(height: 5,)
          ],
        ),
      ),
    );
  }
}
