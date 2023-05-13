import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medica/res/theme/app_colors.dart';

class ReuseAbleProfileImage extends StatelessWidget {
  final VoidCallback changeImage;
  final XFile? image;
  const ReuseAbleProfileImage({Key? key, required this.changeImage, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: AlignmentDirectional.bottomEnd,
      fit: StackFit.passthrough,
      children: [
        ClipOval(
          child: SizedBox.fromSize(
            size: const Size.fromRadius(60),
            child: Container(
                padding: const EdgeInsets.only(left: 15, top: 15),
                height: 100,
                width: 100,
                color: const Color(0xfff5f5f8),
                child: image == null? Image.asset('assets/icons/user.png'):Image.file(File(image!.path))
            ),
          ),
        ),

        Positioned(
          bottom: 1,
          right: 1,
          child: Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            height: 28,
            width: 28,
            decoration: BoxDecoration(
                color: const Color(AppColors.secondaryColor),
                borderRadius: BorderRadius.circular(8)
            ),
            child: IconButton(onPressed: changeImage, icon: Image.asset('assets/icons/pencil.png',)),
          ),
        )

      ],
    );
  }
}
