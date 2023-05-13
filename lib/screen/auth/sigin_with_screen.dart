// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:medica/component/global/my_button.dart';
import 'package:medica/component/shared/screen.dart';
import 'package:medica/screen/auth/component/my_devider.dart';
import 'package:medica/screen/auth/component/my_rich_text.dart';
import 'package:medica/screen/auth/component/social_media_tile.dart';
import 'package:medica/util/route/routes_name.dart';

class SignInWithScreen extends StatelessWidget {
  const SignInWithScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Screen(
        child: Column(
          children: [
            //image
            Image.asset(
              'assets/login.png',
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            //title
            const Text(
              'Let\'s you in',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            //continue with facebook
            SocialMediaTile(
              width: size.width / 1,
              iconPath: 'assets/icons/facebook.png',
              text: 'Continue with Facebook',
              onTap: () {},
            ),
            const SizedBox(
              height: 15,
            ),

            //continue with google
            SocialMediaTile(
              width: size.width / 1,
              iconPath: 'assets/icons/google.png',
              text: 'Continue with Google',
              onTap: () {},
            ),
            const SizedBox(
              height: 15,
            ),

            //continue with apple
            SocialMediaTile(
              width: size.width / 1,
              iconPath: 'assets/icons/apple.png',
              text: 'Continue with Apple',
              onTap: () {},
            ),
            //divider
            const MyDivider(text: 'or'),
            const SizedBox(
              height: 25,
            ),

            //sign in button
            MyButton(
                text: 'Sign in with password',
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.signInScreen);
                }),
            const SizedBox(
              height: 20,
            ),

            //don't have an account
            MyRichText(
                text: 'Don\'t have an account?',
                linkText: 'Sign up',
                onTap: () {
                  debugPrint('sign up');
                  Navigator.pushNamed(context, RoutesName.signupScreen);
                }),
            const SizedBox(
              height: 8,
            )
          ],
        ),
        isBackButton: false);
  }
}
