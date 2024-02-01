import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

@immutable
final class AppToast {
  const AppToast._();
  static late final FToast _fToast;

  static Future<void> init(BuildContext context) async {
    _fToast = FToast();
    _fToast.init(context);
  }

  // show

  static Future<void> show(String message, {Color? backgroundColor, Color? textColor}) async {
    _fToast.showToast(
      child: Text(message, style: TextStyle(color: textColor ?? Colors.white)),
      gravity: ToastGravity.BOTTOM,
    );
  }
}
