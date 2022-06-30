import 'package:ecomarce_app/src/data/repository/home_repository/home_repository.dart';

import 'injector.dart';

Future<void> initializeDataModule() async {
  injector.registerFactory<HomeRepository>(() => HomeRepositoryImp());
}
