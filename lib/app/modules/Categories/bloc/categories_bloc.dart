import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_shop_sphere/app/data/models/category_model.dart';
import 'package:shop_shop_sphere/app/data/repositories/categories_repo.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepo categoriesRepo;
  CategoriesBloc({required this.categoriesRepo}) : super(CategoriesInitial()) {
    on<FetchCategoriesRequested>(fetchCategoriesRequested);
  }

  FutureOr<void> fetchCategoriesRequested(
    FetchCategoriesRequested event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(CategoriesFetchLoadingState());
    try {
      final categories = await categoriesRepo.getCategories();
      emit(CategoriesFetchSuccessState(categories: categories));
    } catch (e) {
      emit(CategoriesFetchErrorState(errorMessage: e.toString()));
    }
  }
}
