import 'package:flutter/material.dart';
import 'package:shop_shop_sphere/app/data/models/category_model.dart';
import 'package:shop_shop_sphere/app/data/models/products_model.dart';
import 'package:shop_shop_sphere/app/services/firebase_categories_service.dart';
import 'package:shop_shop_sphere/app/services/firebase_products_services.dart';

class ProductsRepo {
  final FirebaseProductsServices firebaseProductsServices;
  ProductsRepo({required this.firebaseProductsServices});

  Future<List<ProductModel>> getFeaturedProducts() async {
    debugPrint("Fetching featured products from Firebase...");
    final featuredProductsSnapshot = await firebaseProductsServices
        .fetchFeaturedProducts();

    final featuredProducts = featuredProductsSnapshot.docs.map((doc) {
      return ProductModel.fromMap(doc.data(), id: doc.id);
    }).toList();

    debugPrint("Fetched ${featuredProducts.length} featured products.");
    return featuredProducts;
  }
}
