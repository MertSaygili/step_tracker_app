import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:step_tracker_app/app/injector.dart';

@immutable
final class Init {
  const Init._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await Injector.init();
  }
}
