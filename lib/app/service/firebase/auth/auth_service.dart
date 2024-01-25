abstract class AuthService {
  Future<void> signUp({required String name, required String email, required String password});
  Future<void> signIn({required String email, required String password});
  Future<void> googleSignIn();
}
