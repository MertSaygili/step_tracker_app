import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:step_tracker_app/app/constants/app_strings.dart';
import 'package:step_tracker_app/app/init.dart';
import 'package:step_tracker_app/app/localization/app_localization.dart';
import 'package:step_tracker_app/presentation/login/view/login_screen.dart';

Future<void> main() async {
  await Init.init();
  runApp(
    EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      path: AppLocalization.localizationJsonPath,
      fallbackLocale: AppLocalization.supportedLocales.first,
      startLocale: AppLocalization.supportedLocales.first,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: AppLocalization.supportedLocales,
      locale: context.locale,
      title: AppStrings.appName,
      theme: ThemeData.dark(),
      home: const LoginScreen(),
    );
  }
}
