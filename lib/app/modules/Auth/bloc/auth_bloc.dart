import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_shop_sphere/app/data/repositories/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  late final StreamSubscription<User?> authSubscription;
  bool isInitialCheck = true;
  AuthBloc({required this.authRepo}) : super(AuthInitial()) {
    authSubscription = authRepo.authStateChanges.listen((user) {
      add(AuthStateChanged(user: user));
    });

    on<AuthStateChanged>(authStateChanged);
    on<RegistoredRquested>(registoredRquested);
    on<LoginRequested>(loginRequested);
    on<AuthLogoutRequested>(authLogoutRequested);
  }

  FutureOr<void> registoredRquested(
    RegistoredRquested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());

    try {
      await authRepo.register(
        email: event.email,
        password: event.password,
        fullName: event.fullname,
      );

      emit(
        AuthRegistoredUserSuccessState(
          successState: "Account Created Successfully",
        ),
      );
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> loginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    try {
      await authRepo.login(email: event.email, password: event.password);
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  void authStateChanged(AuthStateChanged event, Emitter<AuthState> emit) async {
    if (isInitialCheck) {
      emit(AuthInitial());
      await Future.delayed(Duration(seconds: 5));
      isInitialCheck = false;
    }

    if (event.user != null) {
      emit(AuthenticatedState());
    } else {
      emit(UnAuthenticatedState());
    }
  }

  @override
  Future<void> close() {
    authSubscription.cancel();
    return super.close();
  }

  FutureOr<void> authLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    try {
      await authRepo.logout();
      emit(AuthLogoutSuccess(successState: "Logged Out Successfully"));
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }
}
