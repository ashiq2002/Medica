import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  final String text;
  const MyDivider({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Expanded(
                child: Divider(
                  thickness: 1.0,
                  color: Colors.grey.withOpacity(0.2),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(text, style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.5)
              ),),
            ),
            Expanded(
                child: Divider(
                    thickness: 1.0, color: Colors.grey.withOpacity(0.2))),
          ],
        ),
      ],
    );
  }
}

