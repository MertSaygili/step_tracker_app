import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

@immutable
final class Init {
  const Init._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }
}
