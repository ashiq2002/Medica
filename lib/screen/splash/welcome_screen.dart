import 'package:flutter/material.dart';

import '../../util/route/routes_name.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateOnboarding(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    debugPrint('im disposed');
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset('assets/start.png'),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: const [
                //title text
                Text(
                  textAlign: TextAlign.center,
                  'Welcome to Medica',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                //subtitle text
                Text(
                    textAlign: TextAlign.center,
                    'The best online doctor appointment & consultation app of the country for your health and medical needs!',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

//navigate welcome screen
_navigateOnboarding(BuildContext context) async{
  await Future.delayed(const Duration(seconds: 3));
  // ignore: use_build_context_synchronously
  Navigator.pushReplacementNamed(context, RoutesName.onBoardingScreen);
}
