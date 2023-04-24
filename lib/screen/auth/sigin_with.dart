import 'package:flutter/material.dart';

class SignInWithScreen extends StatelessWidget {
  const SignInWithScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
      ),
    );
  }
}
