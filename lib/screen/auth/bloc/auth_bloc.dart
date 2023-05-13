import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/screen/auth/bloc/auth_event.dart';
import 'package:medica/screen/auth/bloc/auth_state.dart';
import 'package:regexpattern/regexpattern.dart';

//bloc for TextFormField state
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    //registered Sign in event
    on<SignInEvent>(_signInEvent);

    //registered Sign in event
    on<SignupEvent>(_signupEvent);

    //registered checkbox event
    on<CheckboxEvent>(_checkboxEvent);

    //registered auth error event
    on<AuthErrorEvent>(_errorEvent);
  }

  //emit email state
  void _signInEvent(SignInEvent event, Emitter<AuthState> emit) {
    debugPrint(
        "password : ${state.password} \nemail : ${state.email} \nisObscure : ${state.isObscure} \n isChecked: ${state.isChecked}");
    emit(state.copyWith(
        email: event.email,
        password: event.password,
        isObscure: event.isObscure));
  }

  //emit email state
  void _signupEvent(SignupEvent event, Emitter<AuthState> emit) {
    debugPrint(
        "password : ${state.password} \nemail : ${state.email} \nisObscure : ${state.isObscure} \n isChecked: ${state.isChecked}");
    emit(state.copyWith(
        email: event.email,
        password: event.password,
        isObscure: event.isObscure));
  }

  //emit checkbox state
  void _checkboxEvent(CheckboxEvent event, Emitter<AuthState> emit){
    emit(state.copyWith(isChecked: event.isChecked));
  }

  void _errorEvent(AuthErrorEvent event, Emitter<AuthState> emit) {
    if (state.password.length < 8 || !state.email.isEmail()) {
      emit(AuthErrorState('failed'));
    }
  }
}
