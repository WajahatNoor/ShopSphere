import 'package:shop_shop_sphere/app/data/models/category_model.dart';
import 'package:shop_shop_sphere/app/services/firebase_categories_service.dart';

class CategoriesRepo {
  final FirebaseCategoriesService firebaseCategoriesService;
  CategoriesRepo({required this.firebaseCategoriesService});

  Future<List<CategoryModel>> getCategories() async {
    final categoriesSnapshot = await firebaseCategoriesService
        .fetchCategories();

    final categories = categoriesSnapshot.docs.map((doc) {
      return CategoryModel.fromMap(doc.data(), doc.id);
    }).toList();

    return categories;
  }
}
