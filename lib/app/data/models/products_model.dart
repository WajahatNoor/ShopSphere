import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String categoryId;
  final String name;
  final String description;
  final int price;
  final int? discountPrice;
  final bool isActive;
  final bool isFeatured;
  final int stockQuantity;
  final DateTime createdAt;
  final List<String> images;

  const ProductModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
    this.discountPrice,
    required this.isActive,
    required this.isFeatured,
    required this.stockQuantity,
    required this.createdAt,
    required this.images,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map, {required String id}) {
    return ProductModel(
      id: id,
      categoryId: map['categoryId'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: (map['price'] as num).toInt(),
      discountPrice: map['discountPrice'] == null
          ? null
          : (map['discountPrice'] as num).toInt(),
      isActive: map['isActive'] as bool? ?? true,
      isFeatured: map['isFeatured'] as bool? ?? false,
      stockQuantity: (map['stockQuantity'] as num?)?.toInt() ?? 0,
      createdAt: map['createdAt'] is Timestamp
          ? (map['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
      images: List<String>.from(map['images'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'name': name,
      'description': description,
      'price': price,
      'discountPrice': discountPrice,
      'isActive': isActive,
      'isFeatured': isFeatured,
      'stockQuantity': stockQuantity,
      'createdAt': Timestamp.fromDate(createdAt),
      'images': images,
    };
  }
}
