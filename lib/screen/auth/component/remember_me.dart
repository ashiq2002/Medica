import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/constent/app_colors.dart';
import 'package:medica/screen/auth/bloc/auth_bloc.dart';
import 'package:medica/screen/auth/bloc/auth_event.dart';
import 'package:medica/screen/auth/bloc/auth_state.dart';

class RememberMe extends StatelessWidget {
  final String text;
  const RememberMe({Key? key, this.text = 'Remember me'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //check box
        BlocBuilder<RememberMeBloc, RememberMeState>(builder: (context, state){
          return Transform.scale(
            scale: 1.2,
            child: Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                side: const BorderSide(
                    color: Color(AppColors.buttonPrimary), width: 2),
                activeColor: const Color(AppColors.buttonPrimary),
                value: state.isChecked,
                onChanged: (value) {
                  BlocProvider.of<RememberMeBloc>(context).add(RememberMeEvent());
                  state.isChecked = value!;
                }),
          );
        }),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
        )
      ],
    );
  }
}
