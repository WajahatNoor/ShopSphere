part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsFeaturedFetchLoadingState extends ProductsState {}

final class ProductsFeaturedFetchSuccessState extends ProductsState {
  final List<ProductModel> featuredProducts;
  const ProductsFeaturedFetchSuccessState({required this.featuredProducts});
}

final class ProductsFeaturedFetchErrorState extends ProductsState {
  final String errorMessage;

  const ProductsFeaturedFetchErrorState({required this.errorMessage});
}
