import 'package:flutter/material.dart';
import 'package:step_tracker_app/presentation/auth/register/view/register_screen.dart';

mixin RegisterScreenMixin<StatalesWidget extends RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}
