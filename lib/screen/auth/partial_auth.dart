import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/component/my_button.dart';
import 'package:medica/component/my_form_field.dart';
import 'package:medica/constent/app_colors.dart';
import 'package:medica/screen/auth/bloc/auth_bloc.dart';
import 'package:medica/screen/auth/bloc/auth_state.dart';
import 'package:medica/screen/auth/component/my_devider.dart';
import 'package:medica/screen/auth/component/my_rich_text.dart';
import 'package:medica/screen/auth/component/remember_me.dart';
import 'package:medica/screen/auth/component/social_media_tile.dart';

enum ScreenName { signIn, signup }

class PartialAuth extends StatelessWidget {
  final String title;
  final String buttonName;
  final String text;
  final String linkText;
  final VoidCallback onPressed;
  final VoidCallback onTap;
  final VoidCallback? forgotPassword;
  final ScreenName screenName;

  const PartialAuth(
      {Key? key,
      required this.title,
      required this.buttonName,
      required this.text,
      required this.linkText,
      required this.onPressed,
      required this.onTap,
      this.forgotPassword,
      required this.screenName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state){
            return Column(
              children: [
                //logo
                Image.asset(
                  'assets/logo.png',
                  height: 132,
                  width: 132,
                ),
                //title
                Text(
                  textAlign: TextAlign.center,
                  title,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),

                //user email form field
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: MyFormField(
                      fieldType: FieldType.email,
                      prefixIcon: Icons.email,
                      hintText: 'Email',
                    )),

                //user password form field
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: MyFormField(
                    obscureText: true,
                    fieldType: FieldType.password,
                    prefixIcon: Icons.lock,
                    hintText: 'Password',
                    suffixIcon: Icons.visibility_off,
                  ),
                ),

                //remember password
                const RememberMe(),
                const SizedBox(
                  height: 10,
                ),

                //signup button
                MyButton(
                  text: buttonName,
                  onTap: onPressed,
                  color: AppColors.buttonSecondary,
                ),
                const SizedBox(
                  height: 10,
                ),

                //forgot the password
                screenName == ScreenName.signIn
                    ? GestureDetector(
                  onTap: forgotPassword,
                  child: const Text(
                    'Forgot the password?',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(AppColors.buttonPrimary)),
                  ),
                )
                    : const SizedBox(),

                //or continue with
                const MyDivider(text: 'or continue with'),
                const SizedBox(
                  height: 8,
                ),

                //continue with social media account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //facebook
                    SocialMediaTile(
                      width: 75,
                      iconPath: 'assets/icons/facebook.png',
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 15,
                    ),

                    //google
                    SocialMediaTile(
                        width: 75,
                        iconPath: 'assets/icons/google.png',
                        onTap: () {}),
                    const SizedBox(
                      width: 15,
                    ),

                    //apple
                    SocialMediaTile(
                        width: 75,
                        iconPath: 'assets/icons/apple.png',
                        onTap: () {}),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                //already have an account
                MyRichText(text: text, linkText: linkText, onTap: onTap),
                const SizedBox(height: 8,)
              ],
            );
          },
        ),
      ),
    );
  }
}
