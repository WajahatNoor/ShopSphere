import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_shop_sphere/app/data/repositories/auth_repo.dart';
import 'package:shop_shop_sphere/app/modules/Auth/bloc/auth_bloc.dart';
import 'package:shop_shop_sphere/app/services/firebase_auth_services.dart';

class AllBlocProviders {
  //DEPENDENCY INJECTION REQUIRED
  static final firebaseAuth = FirebaseAuth.instance;
  static final googleSigninAuth = GoogleSignIn.instance;
  static final authServices = FirebaseAuthServices(
    firebaseAuth: firebaseAuth,
    googleSignIn: googleSigninAuth,
  );

  static final authRepo = AuthRepo(
    authServices: authServices,
    firebaseAuth: firebaseAuth,
  );

  //All Bloc Providers
  static final List<BlocProvider> allProviders = [
    BlocProvider<AuthBloc>(create: (context) => AuthBloc(authRepo: authRepo)),
  ];
}
