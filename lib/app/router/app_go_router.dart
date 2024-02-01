import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:step_tracker_app/app/constants/app_routers.dart';
import 'package:step_tracker_app/presentation/auth/login/view/login_screen.dart';
import 'package:step_tracker_app/presentation/home/s.dart';

@immutable
final class AppGoRouter {
  const AppGoRouter._();

  static final _router = GoRouter(
    routes: [
      GoRoute(
        name: AppRouters.loginName,
        path: AppRouters.loginPath,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        name: AppRouters.registerName,
        path: AppRouters.registerPath,
        builder: (context, state) => const S(),
      ),
    ],
  );

  static GoRouter get router => _router;
}
