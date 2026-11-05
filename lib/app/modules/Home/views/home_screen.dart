import 'package:flutter/material.dart';
import 'package:shop_shop_sphere/app/modules/Home/widgets/categories_section.dart';
import 'package:shop_shop_sphere/app/res/app_colors.dart';
import 'package:shop_shop_sphere/app/res/app_spacings.dart';

import '../widgets/home_header.dart';
import '../widgets/home_search_bar.dart';

import '../widgets/featured_products_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.onNavigationTap});

  final ValueChanged<int>? onNavigationTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.md),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    HomeHeader(),

                    SizedBox(height: AppSpacing.lg),

                    HomeSearchBar(),

                    SizedBox(height: AppSpacing.xl),

                    CategorySection(),

                    SizedBox(height: AppSpacing.xl),

                    FeaturedProductsSection(),

                    SizedBox(height: AppSpacing.lg),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
