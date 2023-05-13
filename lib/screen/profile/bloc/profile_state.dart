import 'package:image_picker/image_picker.dart';

class ProfileState {
  final String fullName, nickName, dateOfBirth, email, gender;
  final XFile? image;

  ProfileState(
      {this.image,
      this.fullName = "",
      this.nickName = "",
      this.dateOfBirth = "",
      this.email = "",
      this.gender = ""});

  ProfileState copyWith(
          {XFile? image,
          String? fullName,
          String? nickName,
          String? dateOfBirth,
          String? email,
          String? gender}) =>
      ProfileState(
          image: image ?? this.image,
          fullName: fullName ?? this.fullName,
          nickName: nickName ?? this.nickName,
          dateOfBirth: dateOfBirth ?? this.dateOfBirth,
          email: email ?? this.email,
          gender: gender ?? this.gender);
}
