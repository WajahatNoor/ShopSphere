part of 'registor_bloc.dart';

sealed class RegistorState extends Equatable {
  const RegistorState();
  
  @override
  List<Object> get props => [];
}

final class RegistorInitial extends RegistorState {}
