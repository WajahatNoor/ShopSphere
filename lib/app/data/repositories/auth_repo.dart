import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_shop_sphere/app/services/firebase_auth_services.dart';

class AuthRepo {
  final FirebaseAuthServices authServices;
  final FirebaseAuth firebaseAuth;
  AuthRepo({required this.authServices, required this.firebaseAuth});

  //current user
  User? get currentUser => firebaseAuth.currentUser;

  // Authentication Session
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<User> login({required String email, required String password}) async {
    try {
      final result = await authServices.login(email: email, password: password);
      return result.user!;
    } on FirebaseAuthException catch (e) {
      throw _mapError(e);
    }
  }

  Future<User> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final result = await authServices.register(
        fullName: fullName,
        email: email,
        password: password,
      );
      return result.user!;
    } on FirebaseAuthException catch (e) {
      throw _mapError(e);
    }
  }

  Future<void> logout() => authServices.logout();

  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await authServices.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw _mapError(e);
    }
  }

  String _mapError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return 'Email or password is incorrect';
      case 'email-already-in-use':
        return 'This email is already registered';
      case 'weak-password':
        return 'Password is too weak';
      case 'invalid-email':
        return 'Enter a valid email';
      default:
        return e.message ?? 'Something went wrong';
    }
  }
}
