import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserve extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    super.onCreate(bloc);
    print("${bloc.runtimeType} Created!");
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    print("$bloc Change - $change");
  }
}
