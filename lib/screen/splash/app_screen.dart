import 'package:flutter/material.dart';
import 'package:medica/util/route/routes_name.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateWelcome(context);
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

      body: Stack(
        children: [
          //logo and text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png', height: 50, width: 50,),
                  const Text('Medica', style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700
                  ),),
                ],
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Center(child: CircularProgressIndicator(),),
              SizedBox(height: 100,)
            ],
          )
        ],
      ),
    );
  }
}

//navigate welcome screen
_navigateWelcome(BuildContext context) async{
  await Future.delayed(const Duration(seconds: 2));
  // ignore: use_build_context_synchronously
  Navigator.pushReplacementNamed(context, RoutesName.welcomeScreen);
}
