// ignore_for_file: no_default_cases

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:step_tracker_app/presentation/widgets/error/custom_error_screen.dart';
import 'package:step_tracker_app/presentation/widgets/loading/custom_loading.dart';

class SnapshotManager extends StatelessWidget {
  const SnapshotManager({required this.future, required this.done, super.key, this.loading, this.error});

  final Widget? loading;
  final Widget? error;
  final Widget done;
  final Future<QuerySnapshot<Map<String, dynamic>>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return loading ?? const CustomLoading();
          case ConnectionState.done:
            if (snapshot.data?.docs.isNotEmpty ?? false) {
              return done;
            } else {
              return error ?? const CustomErrorScreen(errorImagePath: 'assets/images/error.png');
            }
          default:
            return error ?? const CustomErrorScreen(errorImagePath: 'assets/images/error.png');
        }
      },
    );
  }
}
