part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class FetchCategoriesRequested extends HomeEvent {}

final class FetchFeatureProductsRequested extends HomeEvent {}
