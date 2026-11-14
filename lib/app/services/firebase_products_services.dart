import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseProductsServices {
  final FirebaseFirestore firestore;
  FirebaseProductsServices({required this.firestore});

  Future<QuerySnapshot<Map<String, dynamic>>> fetchFeaturedProducts() async {
    final featuredProductsDocs = await firestore
        .collection('products')
        .where('isActive', isEqualTo: true)
        .where('isFeatured', isEqualTo: true)
        .limit(10)
        .get();
    debugPrint("Products ::: $featuredProductsDocs");
    return featuredProductsDocs;
  }
}
