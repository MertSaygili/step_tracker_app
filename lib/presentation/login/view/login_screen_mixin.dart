import 'package:flutter/material.dart';
import 'package:step_tracker_app/presentation/login/view/login_screen.dart';

mixin LoginScreenMixin<StatelessWidget extends LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}
