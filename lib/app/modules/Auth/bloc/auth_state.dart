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

final class AuthRegistoredUserSuccessState extends AuthActionState {
  final String successState;

  AuthRegistoredUserSuccessState({required this.successState});
}

final class AuthLogoutSuccess extends AuthActionState {
  final String successState;

  AuthLogoutSuccess({required this.successState});
}

final class AuthErrorState extends AuthActionState {
  final String errorMessage;

  AuthErrorState({required this.errorMessage});
}
