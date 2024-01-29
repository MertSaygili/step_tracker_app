import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final class InternetConnection {
  InternetConnection._();

  // check internet connection, if it is connected show snackbar that shows internet connection is connected
  static Future<void> checkInternetConnection(GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey) async {
    final connectionChecker = InternetConnectionChecker();

    connectionChecker.onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        // hide current snackbar if exists -- probably it is the snackbar that shows internet connection is disconnected
        scaffoldMessengerKey.currentState?.hideCurrentSnackBar();

        // show snackbar that shows internet connection is connected
      } else {
        // show internet connection is disconnected snackbar with infinite duration
      }
    });
  }
}
