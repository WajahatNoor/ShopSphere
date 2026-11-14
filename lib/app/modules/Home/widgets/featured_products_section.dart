import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_shop_sphere/app/data/models/products_model.dart';
import 'package:shop_shop_sphere/app/modules/Home/bloc/home_bloc.dart';
import 'package:shop_shop_sphere/app/modules/Products/bloc/products_bloc.dart';

import 'package:shop_shop_sphere/app/res/app_colors.dart';
import 'package:shop_shop_sphere/app/res/app_radious.dart';
import 'package:shop_shop_sphere/app/res/app_spacings.dart';
import 'package:shop_shop_sphere/app/res/app_text_styles.dart';

class FeaturedProductsSection extends StatelessWidget {
  const FeaturedProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, ProductsState>(
      listener: (context, state) {
        if (state is ProductsFeaturedFetchErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is ProductsFeaturedFetchLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProductsFeaturedFetchErrorState) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is ProductsFeaturedFetchSuccessState) {
          final products = state.featuredProducts;

          if (products.isEmpty) {
            return const Center(child: Text('No featured products available'));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Featured Products', style: AppTextStyles.subheading),
                  TextButton(onPressed: () {}, child: const Text('View All')),
                ],
              ),

              const SizedBox(height: AppSpacing.sm),

              SizedBox(
                height: 260,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: AppSpacing.md),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 165,
                      child: ProductCard(
                        product: products[index],
                        onTap: () {
                          // TODO: Open product details
                        },
                        onWishlistTap: () {
                          // TODO: Add/remove wishlist item
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onWishlistTap,
  });

  final ProductModel product;
  final VoidCallback onTap;
  final VoidCallback onWishlistTap;

  @override
  Widget build(BuildContext context) {
    final hasImage = product.images.isNotEmpty;

    final hasDiscount =
        product.discountPrice != null && product.discountPrice! < product.price;

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
                      child: hasImage
                          ? Image.network(
                              product.images.first,
                              fit: BoxFit.contain,
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

                  if (hasDiscount)
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

                  Text(
                    'Rs. ${product.discountPrice ?? product.price}',
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  if (hasDiscount) ...[
                    const SizedBox(height: 2),
                    Text(
                      'Rs. ${product.price}',
                      style: AppTextStyles.caption.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
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
      child: const Center(
        child: Icon(Icons.image_outlined, color: AppColors.primary, size: 55),
      ),
    );
  }
}
