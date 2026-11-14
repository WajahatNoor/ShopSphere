import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_shop_sphere/app/data/models/products_model.dart';
import 'package:shop_shop_sphere/app/data/repositories/products_repo.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepo productsRepo;
  ProductsBloc({required this.productsRepo}) : super(ProductsInitial()) {
    on<FetchFeatureProductsRequested>(fetchFeatureProductsRequested);
  }

  Future<void> fetchFeatureProductsRequested(
    FetchFeatureProductsRequested event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsFeaturedFetchLoadingState());
    try {
      final featuredProducts = await productsRepo.getFeaturedProducts();
      emit(
        ProductsFeaturedFetchSuccessState(featuredProducts: featuredProducts),
      );
    } catch (e) {
      emit(ProductsFeaturedFetchErrorState(errorMessage: e.toString()));
    }
  }
}
