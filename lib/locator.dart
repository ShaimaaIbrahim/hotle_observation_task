import 'package:get_it/get_it.dart';
import 'package:hotel_observation_assignment/db/database_helper.dart';
import 'package:hotel_observation_assignment/screens/auth/viewmodel/auth_viewmodel.dart';
import 'package:hotel_observation_assignment/screens/main/viewmodel/hotels_viewmodel.dart';
import 'package:hotel_observation_assignment/services/navigation_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DbHelper());
  locator.registerFactory(() => HotelsViewModel());
  locator.registerFactory(() => AuthViewModel());

  DbHelper().init();

}