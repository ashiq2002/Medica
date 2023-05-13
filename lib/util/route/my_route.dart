import 'package:flutter/material.dart';
import 'package:medica/screen/profile/fill_profile_screen.dart';
import 'package:medica/screen/auth/sigin_with_screen.dart';
import 'package:medica/screen/auth/signin_screen.dart';
import 'package:medica/screen/onboarding/onboarding_screen.dart';
import 'package:medica/screen/auth/signup_screen.dart';
import 'package:medica/screen/splash/app_screen.dart';
import 'package:medica/screen/splash/welcome_screen.dart';
import 'package:medica/util/route/routes_name.dart';

class MyRoute{
  static Route<dynamic> generateRoutes(RouteSettings settings){
    switch(settings.name){
      case RoutesName.appScreen: //navigate to appScreen
        return MaterialPageRoute(builder: (_)=> const AppScreen());

      case RoutesName.welcomeScreen: //navigate to welcome screen
        return MaterialPageRoute(builder: (_)=> const WelcomeScreen());

      case RoutesName.onBoardingScreen: //navigate to onBoardingScreen
        return MaterialPageRoute(builder: (_)=> const OnBoardingScreen());

      case RoutesName.signInWithScreen: //navigate to signInWithScreen
        return MaterialPageRoute(builder: (_)=> const SignInWithScreen());

      case RoutesName.signupScreen: //navigate to signup screen
        return MaterialPageRoute(builder: (_)=> const SignupScreen());

      case RoutesName.signInScreen: //navigate to sign in screen
        return MaterialPageRoute(builder: (_)=> const SignInScreen());

      case RoutesName.fillProfileScreen: //navigate to fill profile screen
        return MaterialPageRoute(builder: (_)=> const FillProfileScreen());

      default:
        return MaterialPageRoute(builder: (_)=> const Scaffold(
          body: Center(
            child: Text('no routes found'),
          ),
        ));
    }
  }
}