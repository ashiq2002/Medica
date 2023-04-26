import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medica/screen/auth/bloc/auth_bloc.dart';
import 'package:medica/screen/onboarding/bloc/onboarding_bloc.dart';
import 'package:medica/util/route/my_route.dart';
import 'package:medica/util/route/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<OnBoardingBloc>(create: (context)=> OnBoardingBloc(),),
          BlocProvider<AuthBloc>(create: (context)=> AuthBloc(),),
          BlocProvider<RememberMeBloc>(create: (context)=> RememberMeBloc(),),
          BlocProvider<AuthObscureTextBloc>(create: (context)=> AuthObscureTextBloc(),),
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.mukta().fontFamily,
        ),
        initialRoute: RoutesName.appScreen,
        onGenerateRoute:(settings)=> MyRoute.generateRoutes(settings),
      ),
    );
  }
}
