// ignore_for_file: strict_raw_type

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:step_tracker_app/app/constants/app_routers.dart';
import 'package:step_tracker_app/presentation/auth/get_email/view/get_email_screen.dart';
import 'package:step_tracker_app/presentation/auth/login/view/login_screen.dart';
import 'package:step_tracker_app/presentation/auth/register/view/register_screen.dart';
import 'package:step_tracker_app/presentation/auth/vertification/model/vertification_incoming_data_model.dart';
import 'package:step_tracker_app/presentation/auth/vertification/view/vertification_screen.dart';

@immutable
final class AppGoRouter {
  const AppGoRouter._();

  static CustomTransitionPage _buildPageWithSlideTransition({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
        position: Tween(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
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
            builder: (context, state) => RegisterScreen(),
            pageBuilder: (context, state) => _buildPageWithSlideTransition(
              context: context,
              state: state,
              child: RegisterScreen(),
            ),
          ),
          GoRoute(
            name: AppRouters.vertificationName,
            path: AppRouters.vertificationPath,
            builder: (context, state) => VertificationScreen(
              vertificationIncomingDataModel: state.extra! as VertificationIncomingDataModel,
            ),
          ),
          GoRoute(
            name: AppRouters.getMailName,
            path: AppRouters.getMailPath,
            builder: (context, state) => GetEmailScreen(),
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}
