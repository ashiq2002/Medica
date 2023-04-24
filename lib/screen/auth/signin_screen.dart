import 'package:flutter/material.dart';
import 'package:medica/screen/auth/partial_auth.dart';
import 'package:medica/util/route/routes_name.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartialAuth(
      screenName: ScreenName.signIn,
      title: 'Login to your account',
      buttonName: 'Sign in',
      text: 'Don\'t have an account?',
      linkText: 'Sign up',

      //signup button
      onPressed: () {
        debugPrint('signup button');
      },

      //from link text
      onTap: () {
        debugPrint('sign in link text');
        Navigator.pushNamed(context, RoutesName.signupScreen);
      },

      //forgot password text
      forgotPassword: () {
        debugPrint('forgot password');
      },
    );
  }
}
