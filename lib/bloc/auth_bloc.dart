import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
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
    });

    on<AuthLogoutRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await Future.delayed(const Duration(seconds: 1), () {
          return emit(AuthInitial());
        });
      } catch (e) {
        return emit(AuthFailure(e.toString()));
      }
    });
  }
}
