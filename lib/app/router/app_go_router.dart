// ignore_for_file: strict_raw_type

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:step_tracker_app/app/constants/app_routers.dart';
import 'package:step_tracker_app/presentation/auth/login/view/login_screen.dart';
import 'package:step_tracker_app/presentation/auth/register/view/register_screen.dart';

@immutable
final class AppGoRouter {
  const AppGoRouter._();

  static CustomTransitionPage _buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
        opacity: animation,
        alwaysIncludeSemantics: true,
      ),
    );
  }

  static final _router = GoRouter(
    routes: [
      GoRoute(
        name: AppRouters.loginName,
        path: AppRouters.loginPath,
        builder: (context, state) => LoginScreen(),
        routes: [
          GoRoute(
            name: AppRouters.registerName,
            path: AppRouters.registerPath,
            builder: (context, state) => const RegisterScreen(),
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}
