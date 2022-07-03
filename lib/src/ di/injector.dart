import 'package:ecomarce_app/src/%C2%A0di/bloc_module.dart';
import 'package:ecomarce_app/src/%C2%A0di/data_module.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependency() async {
  await initializeBlocModule();

  await initializeDataModule();
}
