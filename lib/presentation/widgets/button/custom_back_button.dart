import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:step_tracker_app/app/constants/app_icons.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.function});

  final VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => function == null ? context.pop() : function!(),
      icon: const Icon(AppIcons.goBackIos),
    );
  }
}
