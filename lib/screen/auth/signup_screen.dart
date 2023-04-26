import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/component/shared/screen.dart';
import 'package:medica/util/route/routes_name.dart';
import '../../component/my_button.dart';
import '../../component/my_form_field.dart';
import '../../res/theme/app_colors.dart';
import 'bloc/auth_bloc.dart';
import 'bloc/auth_event.dart';
import 'bloc/auth_state.dart';
import 'component/my_devider.dart';
import 'component/my_rich_text.dart';
import 'component/remember_me.dart';
import 'component/social_media_tile.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Screen(
        isBackButton: true,
        child: Center(
          child: Column(
            children: [
              //logo
              Image.asset(
                'assets/logo.png',
                height: 132,
                width: 132,
              ),
              //title
              const Text(
                textAlign: TextAlign.center,
                'Create new account',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),

              //user form field
              //user form field
              Column(
                children: [
                  //user email form field
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: MyFormField(
                      controller: _emailController,
                      fieldType: FieldType.email,
                      prefixIcon: Icons.email,
                      hintText: 'Email',
                    ),
                  ),

                  //user password form field
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: MyFormField(
                      controller: _passwordController,
                      fieldType: FieldType.password,
                      prefixIcon: Icons.lock,
                      hintText: 'Password',
                    ),
                  ),
                ],
              ),

              //remember password
              const RememberMe(),
              const SizedBox(
                height: 10,
              ),

              //signup button
              MyButton(
                text: 'Sign up',
                onTap: () {
                  debugPrint(_emailController.text);
                },
                color: AppColors.buttonSecondary,
              ),
              const SizedBox(
                height: 10,
              ),

              //or continue with
              const MyDivider(text: 'or continue with'),
              const SizedBox(
                height: 8,
              ),

              //continue with social media account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //facebook
                  SocialMediaTile(
                    width: 75,
                    iconPath: 'assets/icons/facebook.png',
                    onTap: () {},
                  ),
                  const SizedBox(
                    width: 15,
                  ),

                  //google
                  SocialMediaTile(
                      width: 75,
                      iconPath: 'assets/icons/google.png',
                      onTap: () {}),
                  const SizedBox(
                    width: 15,
                  ),

                  //apple
                  SocialMediaTile(
                      width: 75,
                      iconPath: 'assets/icons/apple.png',
                      onTap: () {}),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              //already have an account
              MyRichText(
                  text: 'Already have an account?',
                  linkText: 'Sign in',
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.signInScreen);
                  }),
              const SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      );
    });
  }
}
