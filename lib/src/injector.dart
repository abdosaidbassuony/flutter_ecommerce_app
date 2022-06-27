import 'package:get_it/get_it.dart';

import 'data/repository/home_repository/home_repository.dart';
import 'package:ecomarce_app/src/presentation/bloc/home_bloc/home_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependency() async {
  await initializeDataModule();
  await initializeBlocModule();
}

initializeBlocModule() {
  injector.registerFactory<HomeBloc>(() => HomeBloc(injector()));
}

Future<void> initializeDataModule() async {
  injector.registerFactory<HomeRepository>(() => HomeRepositoryImp());
}
