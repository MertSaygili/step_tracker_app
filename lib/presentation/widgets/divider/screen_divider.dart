import 'package:core/context_extension.dart';
import 'package:flutter/material.dart';

class ScreenDivider extends StatelessWidget {
  const ScreenDivider({required this.middleText, required this.textColor, super.key});

  final String middleText;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: context.width * 0.35,
          child: const Divider(color: Colors.grey, thickness: 1),
        ),
        Padding(
          padding: context.paddingMedium,
          child: Text(middleText, style: context.bodyLarge.copyWith(color: textColor, fontWeight: FontWeight.w600)),
        ),
        SizedBox(
          width: context.width * 0.35,
          child: const Divider(color: Colors.grey, thickness: 1),
        ),
      ],
    );
  }
}
