part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SendPhoneRequest extends AuthEvent {
  final String phoneNumber;

  SendPhoneRequest({required this.phoneNumber});
}

class SendCodeRequest extends AuthEvent {
  final String code;

  SendCodeRequest({required this.code});
}
