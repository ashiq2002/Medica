abstract class AuthState{}

class AuthInitialState extends AuthState{}

class AuthValidState extends AuthState{}

class AuthLoadingState extends AuthState{}

class AuthErrorState extends AuthState{
  final String errorMessage;

  AuthErrorState(this.errorMessage);
}

class AuthObscureState {
  bool obscure;

  AuthObscureState({this.obscure = false});
}

class RememberMeState{
  bool isChecked;

  RememberMeState({this.isChecked = false});
}