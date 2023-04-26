import 'package:medica/component/my_form_field.dart';

abstract class AuthEvent{}

class AuthTextChangeEvent extends AuthEvent{
  final String email;
  final String password;
  final FieldType fieldType;

  AuthTextChangeEvent(this.email, this.password, this.fieldType);
}

class AuthTextSubmittedEvent extends AuthEvent{
  final String email;
  final String password;

  AuthTextSubmittedEvent(this.email, this.password);
}

class AuthObscureEvent {}

class RememberMeEvent{}