import 'package:image_picker/image_picker.dart';

class ProfileEvent{
  final String fullName, nickName, dateOfBirth, email, gender;
  final XFile? image;

  ProfileEvent(
      {this.fullName="",
      this.nickName="",
      this.dateOfBirth="",
      this.email="",
      this.gender="",
      this.image});
}