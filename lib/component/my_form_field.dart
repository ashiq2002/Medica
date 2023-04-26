import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/res/theme/app_colors.dart';
import 'package:medica/screen/auth/bloc/auth_bloc.dart';
import 'package:medica/screen/auth/bloc/auth_event.dart';
import 'package:medica/screen/auth/bloc/auth_state.dart';

enum FieldType { email, password }

class MyFormField extends StatelessWidget {
  final IconData prefixIcon;
  final int iconColor;
  final String hintText;
  final FieldType fieldType;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const MyFormField(
      {Key? key,
      required this.prefixIcon,
      required this.hintText,
      this.iconColor = AppColors.iconColor,
      required this.fieldType,
      required this.controller, this.onChanged,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthObscureTextBloc, AuthObscureState>(
        builder: (context, state) {
      return TextFormField(
        controller: controller,
        obscureText: fieldType == FieldType.password ? state.obscure : false,
        decoration: InputDecoration(
          fillColor: const Color(AppColors.fillColor),
          filled: true,
          prefixIcon: Icon(
            prefixIcon,
            color: Color(iconColor),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              state.obscure = !state.obscure;
              BlocProvider.of<AuthObscureTextBloc>(context)
                  .add(AuthObscureEvent());
              debugPrint('${state.obscure}');
            },
            child: fieldType == FieldType.password
                ? Icon(
                    state.obscure?Icons.visibility_off:Icons.visibility,
                    color: Color(iconColor),
                  )
                : const SizedBox(),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(AppColors.hintColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color(AppColors.fillColor),
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color(AppColors.fillColor),
              )),
        ),
        onChanged: (val){
          BlocProvider.of<AuthBloc>(context).add(AuthTextChangeEvent(controller.text, controller.text, fieldType));
        },
      );
    });
  }
}
