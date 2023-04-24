import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/screen/onboarding/bloc/onboarding_bloc.dart';
import 'package:medica/screen/onboarding/bloc/onboarding_event.dart';
import 'package:medica/screen/onboarding/bloc/onboarding_state.dart';
import 'package:medica/util/route/routes_name.dart';

import 'component/onboarding_tile.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Scaffold(body: BlocBuilder<OnBoardingBloc, OnBoardingState>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (index) {
                  state.page = index;
                  BlocProvider.of<OnBoardingBloc>(context)
                      .add(OnBoardingEvent());
                  debugPrint('page ${state.page}');
                },
                children: [
                  _page(
                    title: 'Thousands of doctors & experts to help your health',
                    imagePath: 'assets/onboarding1.png',
                    index: 0,
                    buttonName: 'Next',
                  ),
                  _page(
                    title:
                        'Health check & consultation easily anywhere anytime',
                    imagePath: 'assets/onboarding2.png',
                    index: 1,
                    buttonName: 'Next',
                  ),
                  _page(
                    title:
                        'Let\'s start living healthy and well with us right now!',
                    imagePath: 'assets/onboarding3.png',
                    index: 2,
                    buttonName: 'Get Started',
                  )
                ],
              ),
              //dot indicator
              Positioned(
                  bottom: size.height / 5.3,
                  child: DotsIndicator(
                    position: state.page.toDouble(),
                    dotsCount: 3,
                    decorator: DotsDecorator(
                        color: Colors.grey.withOpacity(0.5),
                        activeColor: Colors.blue,
                        size: const Size.square(8.0),
                        activeSize: const Size(26.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                  ))
            ],
          );
        },
      )),
    );
  }

  //generate onBoarding pages
  Widget _page(
          {required String imagePath,
          required String title,
          String buttonName = 'Next',
          required int index}) =>
      Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.topCenter,
        children: [
          //onBoarding image
          Positioned(top: 40, child: Image.asset(imagePath)),
          //text, indicator, button
          Positioned(
            bottom: -0,
            child: OnBoardingTile(
                title: title,
                buttonText: buttonName,
                onTap: () {
                  debugPrint('tap $index');
                  if (index < 2) {
                    //animation
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn
                    );
                  } else {
                    //jump to new page
                    Navigator.pushNamedAndRemoveUntil(context, RoutesName.signInWithScreen, (route) => false);
                  }
                }),
          )
        ],
      );
}
