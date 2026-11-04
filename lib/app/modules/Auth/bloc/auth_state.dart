part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthActionState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthenticatedState extends AuthState {}

final class UnAuthenticatedState extends AuthState {}

final class AuthErrorState extends AuthActionState {
  final String errorMessage;

  AuthErrorState({required this.errorMessage});
}

final class ForgotPasswordLoadingState extends AuthState {}

final class ForgotPasswordSuccessState extends AuthActionState {
  ForgotPasswordSuccessState();
}

final class ForgotPasswordErrorState extends AuthActionState {
  final String errorMessage;

  ForgotPasswordErrorState({required this.errorMessage});
}
