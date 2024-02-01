// ignore_for_file: unused_field, unnecessary_lambdas

import 'package:get_it/get_it.dart';
import 'package:step_tracker_app/app/service/dio/service_manager.dart';
import 'package:step_tracker_app/app/service/firebase/auth/auth_service.dart';
import 'package:step_tracker_app/app/service/firebase/auth/auth_service_impl.dart';

final class Injector {
  static final _instance = GetIt.instance;

  // get service manager
  static ServiceManager get serviceManager => _instance.get<ServiceManager>();

  // auth service
  static AuthService get authService => _instance.get<AuthService>();

  static Future<void> init() async {
    _instance
      ..registerLazySingleton<ServiceManager>(() => ServiceManager())
      ..registerLazySingleton<AuthService>(() => AuthServiceImpl());
  }
}
