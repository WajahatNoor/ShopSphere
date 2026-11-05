import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseCategoriesService {
  final FirebaseFirestore firestore;
  FirebaseCategoriesService({required this.firestore});

  Future<QuerySnapshot<Map<String, dynamic>>> fetchCategories() async {
    final categoriesDocs = await firestore
        .collection('categories')
        .where('isActive', isEqualTo: true)
        .orderBy('sortOrder')
        .get();
    debugPrint("CATEGOREIS ::: $categoriesDocs");
    return categoriesDocs;
  }
}
