import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medica/component/global/my_button.dart';
import 'package:medica/component/global/my_date_dialog.dart';
import 'package:medica/component/global/my_form_field.dart';
import 'package:medica/component/global/profile_image.dart';
import 'package:medica/component/shared/screen.dart';
import 'package:medica/res/theme/app_colors.dart';
import 'package:medica/screen/profile/bloc/profile_bloc.dart';
import 'package:medica/screen/profile/bloc/profile_event.dart';
import 'package:medica/screen/profile/component/image_dialog.dart';
import 'package:medica/util/image_util.dart';

import 'bloc/profile_state.dart';

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({Key? key}) : super(key: key);

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  final _fullNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _gender = ["Male", "Female", "Custom"];

  @override
  void dispose() {
    _fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      isBackButton: true,
      appbarTitle: 'Fill Your Profile',
      isCenter: false,
      child: Center(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Column(
              children: [
                //profile image
                ReuseAbleProfileImage(
                    image: state.image,
                    changeImage: () {
                      showDialog(
                          context: context,
                          builder: (context) => ImageDialog(
                                tapGallery: () {
                                  pickImage(ImageSource.gallery);
                                },
                                tapCamera: () {
                                  pickImage(ImageSource.camera);
                                },
                              ));
                    }),
                const SizedBox(
                  height: 15,
                ),

                //user profile field
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        //full name
                        MyFormField(
                          hintText: 'Full Name',
                          controller: _fullNameController,
                          validator: (fullName) {
                            context
                                .read<ProfileBloc>()
                                .add(ProfileEvent(fullName: fullName!));
                            return null;
                          },
                        ),

                        //Nickname
                        MyFormField(
                          hintText: 'Nickname',
                          controller: _fullNameController,
                          validator: (nickName) {
                            context
                                .read<ProfileBloc>()
                                .add(ProfileEvent(fullName: nickName!));
                            return null;
                          },
                        ),

                        //Date of birth
                        MyFormField(
                          hintText: 'Date of Birth',
                          controller: _fullNameController,
                          suffixIcon: Icons.calendar_month_rounded,
                          validator: (dateOfBirth) {
                            return null;
                          },
                          onTap: (){
                            showDialog(context: context, builder: (context)=> const MyDateDialog());
                          },
                        ),

                        //email
                        MyFormField(
                          hintText: 'Email',
                          controller: _fullNameController,
                          suffixIcon: Icons.email_rounded,
                          validator: (email) {
                            return null;
                          },
                        ),

                        //gender spinner
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: DropdownButtonFormField(
                              elevation: 0,
                              validator: (gender) {
                                if (gender != null) {
                                  context
                                      .read<ProfileBloc>()
                                      .add(ProfileEvent(fullName: gender));
                                  return null;
                                }
                                return "gender required";
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Color(AppColors.fillColor))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        color: Color(AppColors.fillColor),
                                      )),
                                  fillColor: const Color(AppColors.fillColor),
                                  filled: true),
                              hint: const Text(
                                'Gender',
                                style: TextStyle(
                                    color: Color(AppColors.hintColor)),
                              ),
                              items: _gender
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                debugPrint(value);
                              }),
                        ),
                      ],
                    )),

                const SizedBox(
                  height: 20,
                ),

                //continue button
                MyButton(
                    text: 'Continue',
                    onTap: () {
                      _formKey.currentState!.validate();
                    }),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
