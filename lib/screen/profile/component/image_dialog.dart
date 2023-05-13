import 'package:flutter/material.dart';
import 'package:medica/res/theme/app_colors.dart';
import 'package:medica/screen/profile/component/icon_button.dart';

class ImageDialog extends StatelessWidget {
  final VoidCallback tapGallery, tapCamera;
  const ImageDialog({Key? key, required this.tapGallery, required this.tapCamera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: Colors.black.withOpacity(0.4),
      title: const Text(
        'Pick image from',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
      content: SizedBox(
        height: size.height / 3,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyIconButton(
                    iconPath: 'assets/icons/gallery.png',
                    onTap: tapGallery,
                    text: 'Gallery',
                  ),
                  MyIconButton(
                      iconPath: 'assets/icons/camera.png',
                      onTap: tapCamera,
                      text: 'Camera'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(AppColors.primaryColor).withOpacity(0.6),
                ),
                child: const Text('Cancel'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
