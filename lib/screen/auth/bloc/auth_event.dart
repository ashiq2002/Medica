abstract class AuthEvent {
  const AuthEvent();
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  final bool isObscure;

  SignInEvent({this.email = "", this.password = "", this.isObscure = true});
}

class SignupEvent extends AuthEvent {
  final String email;
  final String password;
  final bool isObscure;

  SignupEvent({this.email = "", this.password = "", this.isObscure = true,});
}

class CheckboxEvent extends AuthEvent{
  final bool isChecked;

  CheckboxEvent({this.isChecked = false});
}

class AuthErrorEvent extends AuthEvent { }
