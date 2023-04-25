import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/screen/auth/bloc/auth_event.dart';
import 'package:medica/screen/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {}
}

class RememberMeBloc extends Bloc<RememberMeEvent, RememberMeState> {
  RememberMeBloc() : super(RememberMeState(isChecked: false)) {
    on<RememberMeEvent>((event, emit) {
      emit(RememberMeState(isChecked: state.isChecked));
    });
  }
}
