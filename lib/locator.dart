import 'package:get_it/get_it.dart';
import 'package:hotel_observation_assignment/db/database_helper.dart';
import 'package:hotel_observation_assignment/services/navigation_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerFactory(() => DbHelper());

  DbHelper().init();

}