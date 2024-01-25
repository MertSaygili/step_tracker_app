import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// Enum representing collections

// ignore_for_file: constant_identifier_names

enum CollectionEnums {
  /// Users collection
  USERS,
}

// Extension on the Collections enum to provide collection names
extension CollectionNamesExtension on CollectionEnums {
  // Returns the lowercase string representation of the enum value
  String get users => toString().toLowerCase();
}

@immutable
final class Collections {
  const Collections._();

  //* create instance of firestore
  static final _instance = FirebaseFirestore.instance;

  // get collection instances
  static CollectionReference<Map<String, dynamic>> get userCollection => _instance.collection(CollectionEnums.USERS.name);
}
