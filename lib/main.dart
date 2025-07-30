import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_form_validation/app_bloc_observe.dart';
import 'package:login_form_validation/bloc/auth_bloc.dart';
import 'package:login_form_validation/login_screen.dart';
import 'package:login_form_validation/palette.dart';

void main() {
  Bloc.observer = AppBlocObserve();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Palette.backgroundColor,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
