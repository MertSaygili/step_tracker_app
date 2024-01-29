import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:step_tracker_app/app/service/firebase/auth/auth_service.dart';
import 'package:step_tracker_app/app/service/firebase/collections.dart';

class AuthServiceImpl extends AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signUp({required String name, required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        await _registerUser(name: name, email: email, password: password);
      }
    } on FirebaseAuthException catch (e) {
      await Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {}
    } on FirebaseAuthException catch (e) {
      await Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
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

      final x = await FirebaseAuth.instance.signInWithCredential(credential);
      print(x);
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
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
