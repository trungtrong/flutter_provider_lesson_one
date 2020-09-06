import 'package:flutter_provider_lesson_one/core/services/api.dart';
import 'package:flutter_provider_lesson_one/core/services/authentication_service.dart';
import 'package:flutter_provider_lesson_one/core/viewmodels/home_provider.dart';
import 'package:get_it/get_it.dart';
//
import 'package:flutter_provider_lesson_one/core/viewmodels/login_provider.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  /**
   * - Factory: register an instance (class) and keep on this View(Screen)
   *  + When opened this view the new instance is created
   *
   *  - Singleton: create an instance and keep on global over screen
   *  +  The Locator keeps a single instance of your registered type
   *  and will always return you that instance.
   *
   */
  // global for app
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => AuthenticationService());

  // following screen
  locator.registerFactory(() => LoginProvider());
  locator.registerFactory(() => HomeProvider());
}