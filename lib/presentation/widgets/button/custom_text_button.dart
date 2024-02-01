import 'package:core/context_extension.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.text,
    required this.callbackAction,
    super.key,
    this.textColor,
    this.backgroundColor,
    this.splashColor,
    this.letterSpacing,
    this.fontStyle,
  });

  final String text;
  final VoidCallback callbackAction;
  final Color? splashColor;
  final Color? textColor;
  final Color? backgroundColor;
  final double? letterSpacing;
  final FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: callbackAction,
      style: TextButton.styleFrom(
        foregroundColor: splashColor ?? context.borderColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: context.borderRadiusMedium),
      ),
      child: Text(
        text,
        style: context.bodyMedium.copyWith(
          color: textColor,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
        ),
      ),
    );
  }
}
