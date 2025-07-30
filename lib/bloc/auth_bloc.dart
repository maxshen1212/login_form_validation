import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequest);
  }
  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    print("AuthBloc - $change");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print("AuthBloc - $error");
  }

  void _onAuthLoginRequested(AuthLoginRequested event, Emitter emit) async {
    emit(AuthLoading());
    try {
      //from AuthLoginRequested event
      final email = event.email;
      final password = event.password;

      // validation & Sanitilation
      if (!email.contains("@")) {
        return emit(AuthFailure("The email is invalid"));
      }
      if (password.length < 6) {
        return emit(
          AuthFailure(
            "The password length can not be shorter than 6 characters.",
          ),
        );
      }

      // mock successful
      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthSuccess(uid: "$email-$password"));
      });
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }

  void _onAuthLogoutRequest(AuthLogoutRequested event, Emitter emit) async {
    emit(AuthLoading());
    try {
      // mock successful
      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }
}
