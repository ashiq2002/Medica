import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

//pick image from gallery
Future<XFile?> pickImage(ImageSource source) async {
  final ImagePicker picker;
  final XFile? image;
  try {
    picker = ImagePicker();
    image = await picker.pickImage(source: source);
    return image;
  } catch (e) {
    debugPrint(e.toString());
    return null;
  }
}
