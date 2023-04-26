import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/component/my_form_field.dart';
import 'package:medica/screen/auth/bloc/auth_event.dart';
import 'package:medica/screen/auth/bloc/auth_state.dart';
import 'package:regexpattern/regexpattern.dart';

//bloc for TextFormField state
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<AuthTextChangeEvent>((event, emit) => {
          if (!event.email.isEmail() && event.fieldType == FieldType.email)
            {emit(AuthErrorState('please enter valid email'))}
          else if (event.password.length < 8 &&
              event.fieldType == FieldType.password)
            {emit(AuthErrorState('enter at least 8 character password'))}
          else
            {emit(AuthValidState())}
        });
  }
}

//bloc for check box state
class RememberMeBloc extends Bloc<RememberMeEvent, RememberMeState> {
  RememberMeBloc() : super(RememberMeState(isChecked: false)) {
    on<RememberMeEvent>(
        (event, emit) => {emit(RememberMeState(isChecked: state.isChecked))});
  }
}

//bloc for obscure text state
class AuthObscureTextBloc extends Bloc<AuthObscureEvent, AuthObscureState> {
  AuthObscureTextBloc() : super(AuthObscureState(obscure: true)) {
    on<AuthObscureEvent>(
        (event, emit) => {emit(AuthObscureState(obscure: state.obscure))});
  }
}
