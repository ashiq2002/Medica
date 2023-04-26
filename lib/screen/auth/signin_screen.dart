import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/component/my_form_field.dart';
import 'package:medica/component/shared/screen.dart';
import 'package:medica/util/route/routes_name.dart';
import '../../component/my_button.dart';
import '../../res/theme/app_colors.dart';
import 'bloc/auth_bloc.dart';
import 'bloc/auth_state.dart';
import 'component/my_devider.dart';
import 'component/my_rich_text.dart';
import 'component/remember_me.dart';
import 'component/social_media_tile.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              'Login to your account',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),

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
                //error message
                BlocBuilder<AuthBloc, AuthState>(builder: (context, state){
                  if(state is AuthErrorState){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Text(state.errorMessage, style: const TextStyle(
                          color: Colors.red
                      ),),
                    );
                  }else{
                    return const SizedBox();
                  }
                })
              ],
            ),

            //remember password
            const RememberMe(),
            const SizedBox(
              height: 10,
            ),

            //signup button
            MyButton(
              text: 'Sign in',
              onTap: () {
                _formKey.currentState!.validate();
                debugPrint(_emailController.text);
              },
              color: AppColors.buttonSecondary,
            ),
            const SizedBox(
              height: 10,
            ),

            //forgot the password
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Forgot the password?',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(AppColors.buttonPrimary)),
              ),
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
                text: 'Don\'t have an account?',
                linkText: 'Sign up',
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.signupScreen);
                }),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
