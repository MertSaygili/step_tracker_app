import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:step_tracker_app/app/constants/app_strings.dart';
import 'package:step_tracker_app/app/init.dart';
import 'package:step_tracker_app/app/localization/app_localization.dart';
import 'package:step_tracker_app/app/router/app_go_router.dart';
import 'package:step_tracker_app/app/theme/custom_light_theme.dart';
import 'package:step_tracker_app/main_mixin.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with MainMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppGoRouter.router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: AppLocalization.supportedLocales,
      locale: context.locale,
      title: AppStrings.appName,
      theme: CustomLightTheme.themeData,
    );
  }
}
