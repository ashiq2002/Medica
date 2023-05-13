class AuthState {
  final String email;
  final String password;
  final bool isObscure;
  final bool isChecked;

  AuthState(
      {this.isChecked = false,
      this.email = "",
      this.password = "",
      this.isObscure = true});

  AuthState copyWith(
          {String? email,
          String? password,
          bool? isObscure,
          bool? isChecked}) =>
      AuthState(
          email: email ?? this.email,
          password: password ?? this.password,
          isObscure: isObscure ?? this.isObscure,
          isChecked: isChecked ?? this.isChecked);
}

class AuthInitialState extends AuthState {}

class SignInState extends AuthState {}

class SignupState extends AuthState {}

class CheckboxState extends AuthState {}

class AuthErrorState extends AuthState {
  final String errorMessage;

  AuthErrorState(this.errorMessage);
}

