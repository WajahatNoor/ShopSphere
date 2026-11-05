import 'package:flutter/material.dart';

import 'package:shop_shop_sphere/app/res/app_colors.dart';
import 'package:shop_shop_sphere/app/res/app_radious.dart';
import 'package:shop_shop_sphere/app/res/app_spacings.dart';
import 'package:shop_shop_sphere/app/res/app_text_styles.dart';

class FeaturedProductsSection extends StatelessWidget {
  const FeaturedProductsSection({super.key});

  static const products = [
    ProductData(
      name: 'Wireless Earbuds',
      price: 3499,
      oldPrice: 4499,
      icon: Icons.headphones_rounded,
      rating: '4.8',
    ),
    ProductData(
      name: 'Fast Charger',
      price: 1899,
      oldPrice: 2299,
      icon: Icons.charging_station_rounded,
      rating: '4.7',
    ),
    ProductData(
      name: 'Premium Phone Cover',
      price: 999,
      icon: Icons.phone_android_rounded,
      rating: '4.6',
    ),
    ProductData(
      name: 'Power Bank',
      price: 4299,
      oldPrice: 4999,
      icon: Icons.battery_charging_full_rounded,
      rating: '4.8',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Featured Products', style: AppTextStyles.subheading),
            TextButton(
              onPressed: () {
                // TODO: Navigate to all products
              },
              child: const Text('View All'),
            ),
          ],
        ),

        const SizedBox(height: AppSpacing.sm),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.md,
            childAspectRatio: 0.70,
          ),
          itemBuilder: (context, index) {
            return ProductCard(
              product: products[index],
              onTap: () {
                // TODO: Open product details
              },
              onWishlistTap: () {
                // TODO: Add/remove wishlist item
              },
            );
          },
        ),
      ],
    );
  }
}

class ProductData {
  final String name;
  final int price;
  final int? oldPrice;
  final IconData icon;
  final String rating;
  final String? imageUrl;

  const ProductData({
    required this.name,
    required this.price,
    this.oldPrice,
    required this.icon,
    required this.rating,
    this.imageUrl,
  });
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onWishlistTap,
  });

  final ProductData product;
  final VoidCallback onTap;
  final VoidCallback onWishlistTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(AppRadius.card),
                      ),
                      child: product.imageUrl != null
                          ? Image.network(
                              product.imageUrl!,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => _imagePlaceholder(),
                            )
                          : _imagePlaceholder(),
                    ),
                  ),

                  Positioned(
                    top: 6,
                    right: 6,
                    child: Material(
                      color: AppColors.background,
                      shape: const CircleBorder(),
                      child: IconButton(
                        onPressed: onWishlistTap,
                        icon: const Icon(
                          Icons.favorite_border_rounded,
                          size: 19,
                        ),
                        color: AppColors.primary,
                        constraints: const BoxConstraints(
                          minHeight: 36,
                          minWidth: 36,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),

                  if (product.oldPrice != null)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.error,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'SALE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xs),

                  Row(
                    children: [
                      Text(
                        'Rs. ${product.price}',
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),

                  if (product.oldPrice != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      'Rs. ${product.oldPrice}',
                      style: AppTextStyles.caption.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],

                  const SizedBox(height: AppSpacing.xs),

                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: AppColors.warning,
                        size: 16,
                      ),
                      const SizedBox(width: 3),
                      Text(product.rating, style: AppTextStyles.caption),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      color: AppColors.surface,
      child: Center(
        child: Icon(product.icon, color: AppColors.primary, size: 55),
      ),
    );
  }
}
