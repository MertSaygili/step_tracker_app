import 'package:core/context_extension.dart';
import 'package:flutter/material.dart';

class DoubleTextActionButton extends StatelessWidget {
  const DoubleTextActionButton({
    required this.text,
    required this.callbackAction,
    required this.secondText,
    super.key,
    this.textColor,
    this.backgroundColor,
    this.splashColor,
    this.letterSpacing,
    this.fontStyle,
    this.secondTextColor,
  });

  final String text;
  final String secondText;
  final VoidCallback callbackAction;
  final Color? splashColor;
  final Color? textColor;
  final Color? secondTextColor;
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              text,
              style: context.bodyMedium.copyWith(
                color: textColor,
                letterSpacing: letterSpacing,
                fontStyle: fontStyle,
              ),
            ),
          ),
          context.emptyBoxLowHorizontal,
          Flexible(
            child: Text(
              secondText,
              style: context.bodyMedium.copyWith(
                color: secondTextColor,
                letterSpacing: letterSpacing,
                fontStyle: fontStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
