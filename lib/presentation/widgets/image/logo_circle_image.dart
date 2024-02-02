import 'package:core/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:step_tracker_app/app/constants/app_assets.dart';

class LogoCircleImage extends StatelessWidget {
  const LogoCircleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: context.logoRadius,
      backgroundColor: context.transparentColor,
      child: Image.asset(AppAssets.logo),
    );
  }
}
