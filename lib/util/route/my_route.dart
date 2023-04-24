import 'package:flutter/material.dart';
import 'package:medica/screen/auth/sigin_with.dart';
import 'package:medica/screen/onboarding/onboarding_screen.dart';
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

      default:
        return MaterialPageRoute(builder: (_)=> const Scaffold(
          body: Center(
            child: Text('no routes found'),
          ),
        ));
    }
  }
}