import 'package:flutter/material.dart';
import 'package:medica/screen/auth/partial_auth.dart';
import 'package:medica/util/route/routes_name.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartialAuth(
      screenName: ScreenName.signup,
      title: 'Create new account',
      buttonName: 'Sign up',
      text: 'Already have an account?',
      linkText: 'Sign in',

      //signup button
      onPressed: () {
        debugPrint('signup button');
      },

      //from link text
      onTap: () {
        debugPrint('sign in link text');
        Navigator.pushReplacementNamed(context, RoutesName.signInScreen);
      },
    );
  }
}
