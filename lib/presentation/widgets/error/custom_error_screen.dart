import 'package:flutter/material.dart';

class CustomErrorScreen extends StatelessWidget {
  const CustomErrorScreen({required this.errorImagePath, super.key});

  final String errorImagePath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(errorImagePath, fit: BoxFit.cover);
  }
}
