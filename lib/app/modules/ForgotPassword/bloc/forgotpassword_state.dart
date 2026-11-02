part of 'forgotpassword_bloc.dart';

sealed class ForgotpasswordState extends Equatable {
  const ForgotpasswordState();
  
  @override
  List<Object> get props => [];
}

final class ForgotpasswordInitial extends ForgotpasswordState {}
