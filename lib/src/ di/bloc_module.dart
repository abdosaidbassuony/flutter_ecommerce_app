import 'package:ecomarce_app/src/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:ecomarce_app/src/presentation/bloc/main_screen_bloc/main_screen_bloc.dart';

import 'injector.dart';

initializeBlocModule() {
  injector.registerFactory<MainScreenBloc>(() => MainScreenBloc());

  injector.registerFactory<HomeBloc>(() => HomeBloc(injector()));
}
