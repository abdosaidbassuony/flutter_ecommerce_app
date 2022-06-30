import 'package:ecomarce_app/src/presentation/bloc/home_bloc/home_bloc.dart';

import 'injector.dart';

initializeBlocModule() {
  injector.registerFactory<HomeBloc>(() => HomeBloc(injector()));
}