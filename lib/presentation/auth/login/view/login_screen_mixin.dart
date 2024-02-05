import 'package:flutter/material.dart';
import 'package:step_tracker_app/presentation/auth/login/view/login_screen.dart';

mixin LoginScreenMixin<StatelessWidget extends LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
  }
}
