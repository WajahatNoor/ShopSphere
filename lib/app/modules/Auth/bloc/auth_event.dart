part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class RegistoredRquested extends AuthEvent {
  final String email;
  final String fullname;
  final String password;

  const RegistoredRquested({
    required this.email,
    required this.fullname,
    required this.password,
  });
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested({required this.email, required this.password});
}

class AuthLogoutRequested extends AuthEvent {}

class ForgotPasswordRequested extends AuthEvent {
  final String email;

  const ForgotPasswordRequested({required this.email});
}

class GoogleSignInRequested extends AuthEvent {}

class AuthStateChanged extends AuthEvent {
  final User? user;

  const AuthStateChanged({required this.user});
}
