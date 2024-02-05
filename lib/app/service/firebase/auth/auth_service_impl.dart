// ignore_for_file: unused_catch_clause

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:step_tracker_app/app/service/firebase/auth/auth_exceptions.dart';
import 'package:step_tracker_app/app/service/firebase/auth/auth_service.dart';
import 'package:step_tracker_app/app/service/firebase/collections.dart';

class AuthServiceImpl extends AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<bool> signUp({required String name, required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        await _registerUser(name: name, email: email, password: password);
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      await Fluttertoast.showToast(msg: AuthExceptionHandler.fromException(e.code).get_message, toastLength: Toast.LENGTH_LONG);
      return false;
    }
  }

  @override
  Future<bool> signIn({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user?.uid != null) {
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      await Fluttertoast.showToast(msg: AuthExceptionHandler.fromException(e.code).get_message, toastLength: Toast.LENGTH_LONG);
      return false;
    }
  }

  @override
  Future<void> googleSignIn() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final user = await FirebaseAuth.instance.signInWithCredential(credential);

      if (user.user != null) {
        await _registerUser(
          name: user.user!.displayName!,
          email: user.user!.email!,
          password: user.user!.uid,
        );
        return;
      }
    } on FirebaseAuthException catch (e) {
      await Fluttertoast.showToast(msg: AuthExceptionHandler.fromException(e.code).get_message, toastLength: Toast.LENGTH_LONG);
      return;
    }
  }

  Future<void> _registerUser({required String name, required String email, required String password}) async {
    await Collections.userCollection.doc().set(
      {
        'email': email,
        'name': name,
        'password': password,
      },
    );
  }
}
