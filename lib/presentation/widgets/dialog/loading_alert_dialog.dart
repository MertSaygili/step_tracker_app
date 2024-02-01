// ignore_for_file: inference_failure_on_function_invocation

import 'package:core/context_extension.dart';
import 'package:flutter/material.dart';

final class LoadingAlertDialog {
  const LoadingAlertDialog._();

  static Future<void> showLoading(BuildContext context) async {
    const loadingSize = 50.0;
    await showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: SizedBox(
            height: loadingSize,
            width: loadingSize,
            child: Center(
              child: CircularProgressIndicator(color: context.whiteColor),
            ),
          ),
        );
      },
    );
  }
}
