import 'package:core/context_extension.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({required this.callbackAction, required this.text, super.key});

  final VoidCallback callbackAction;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: context.primaryColor,
        backgroundColor: context.whiteColor,
      ),
      focusNode: FocusNode(),
      onPressed: callbackAction,
      child: Text(text, style: context.bodyMedium),
    );
  }
}
