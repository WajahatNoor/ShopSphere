part of 'categories_bloc.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesFetchLoadingState extends CategoriesState {}

final class CategoriesFetchSuccessState extends CategoriesState {
  final List<CategoryModel> categories;

  const CategoriesFetchSuccessState({required this.categories});
}

final class CategoriesFetchErrorState extends CategoriesState {
  final String errorMessage;

  const CategoriesFetchErrorState({required this.errorMessage});
}
