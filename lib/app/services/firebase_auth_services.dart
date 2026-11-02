// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  final FirebaseAuth firebaseAuth;
  FirebaseAuthServices({required this.firebaseAuth});

  // Register
  Future<UserCredential> register({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  // Login
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  //logout user
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  // Forgot Password
  Future<void> sendPasswordResetEmail({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email.trim());
  }

  //current user
  User? get currentUser => firebaseAuth.currentUser;

  // Authentication Session
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();
}
