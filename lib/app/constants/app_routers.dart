import 'package:flutter/widgets.dart';

@immutable
final class AppRouters {
  const AppRouters._();

  // paths
  static const String loginPath = '/';
  static const String registerPath = 'register';
  static const String vertificationPath = 'vertification';
  static const String getMailPath = 'getmail';

  // names
  static const String loginName = 'login';
  static const String registerName = 'register';
  static const String vertificationName = 'vertification';
  static const String getMailName = 'getmail';
}
