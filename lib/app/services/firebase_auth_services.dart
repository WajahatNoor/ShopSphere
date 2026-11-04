// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_shop_sphere/app/res/app_contants.dart';

class FirebaseAuthServices {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  FirebaseAuthServices({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  // Register
  Future<UserCredential> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final credentials = await firebaseAuth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
    await credentials.user?.updateDisplayName(fullName);
    return credentials;
  }

  // Login
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //sign in with google

  // Login
  Future<UserCredential> signinWithGoogle() async {
    await googleSignIn.initialize(serverClientId: AppConstants.webClientId);
    final googleUser = await googleSignIn.authenticate();
    final googleAuth = googleUser.authentication;

    final credentials = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    return firebaseAuth.signInWithCredential(credentials);
  }

  //logout user
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  // Forgot Password
  Future<void> sendPasswordResetEmail({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email.trim());
  }
}
