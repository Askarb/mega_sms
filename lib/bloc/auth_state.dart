part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}

class CodeSuccess extends AuthState {}

class CodeError extends AuthState {
  final String message;

  CodeError({required this.message});
}
