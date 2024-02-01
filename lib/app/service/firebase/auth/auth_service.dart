abstract class AuthService {
  Future<bool> signUp({required String name, required String email, required String password});
  Future<bool> signIn({required String email, required String password});
  Future<void> googleSignIn();
}
