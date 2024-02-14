import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:step_tracker_app/app/service/firebase/collections.dart';
import 'package:step_tracker_app/presentation/widgets/firebase/snapshot_manager.dart';

class S extends StatelessWidget {
  const S({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SnapshotManager(
          future: test(),
          done: const Text('done'),
          error: const Text('error'),
          loading: const Text('loading'),
        ),
      ),
    );
  }

  Future<QuerySnapshot<Map<String, dynamic>>> test() async {
    final response = await Collections.userCollection.where('email', isEqualTo: 'mert71719601@gmail.com').get();
    return response;
  }
}
