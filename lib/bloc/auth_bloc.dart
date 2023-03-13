import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/models/auth_model.dart';
import 'package:flutter_application_1/repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repo}) : super(AuthInitial()) {
    on<SendPhoneRequest>(
      (event, emit) async {
        try {
          final result = await repo.sendPhone(event.phoneNumber);
          print(result);

          if (result.status == 1) {
            emit(AuthSuccess());
            uuid = result.object;
          } else {
            emit(AuthError(message: result.message ?? 'Error!'));
          }
        } catch (e) {
          emit(AuthError(message: "Error"));
        }
      },
    );

    on<SendCodeRequest>(
      (event, emit) async {
        String? message;
        if (uuid == null) {
          emit(CodeError(message: "Error: Uuud is null"));
          return;
        }
        try {
          final result = await repo.sendCode(event.code, uuid!);
          if (result.status == 1) {
            emit(CodeSuccess());
          } else {
            print(result.message);
            emit(CodeError(message: result.message ?? 'Error!'));
          }
        } catch (e) {
          emit(CodeError(message: message ?? 'Error'));
        }
      },
    );
  }

  final Repo repo;
  String? uuid;
}
