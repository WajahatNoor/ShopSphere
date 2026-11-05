import 'package:flutter/material.dart';

import 'package:shop_shop_sphere/app/res/app_colors.dart';
import 'package:shop_shop_sphere/app/res/app_radious.dart';
import 'package:shop_shop_sphere/app/res/app_spacings.dart';
import 'package:shop_shop_sphere/app/res/app_text_styles.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  static const categories = [
    _CategoryData('Audio', Icons.headphones_rounded),
    _CategoryData('Chargers', Icons.bolt_rounded),
    _CategoryData('Covers', Icons.phone_android_rounded),
    _CategoryData('Protection', Icons.shield_outlined),
    _CategoryData('Power Banks', Icons.battery_charging_full_rounded),
    _CategoryData('Smartwatches', Icons.watch_outlined),
    _CategoryData('Gadgets', Icons.devices_other_rounded),
    _CategoryData('Gaming', Icons.gamepad_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shop by Category', style: AppTextStyles.subheading),
            TextButton(
              onPressed: () {
                // TODO: Navigate to categories
              },
              child: const Text('See All'),
            ),
          ],
        ),

        const SizedBox(height: AppSpacing.md),

        SizedBox(
          height: 105,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
            itemBuilder: (context, index) {
              final category = categories[index];

              return _CategoryItem(
                name: category.name,
                icon: category.icon,
                onTap: () {
                  // TODO: Open selected category
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryData {
  final String name;
  final IconData icon;

  const _CategoryData(this.name, this.icon);
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    required this.name,
    required this.icon,
    required this.onTap,
  });

  final String name;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 75,
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.border),
              ),
              child: Icon(icon, color: AppColors.primary, size: 27),
            ),

            const SizedBox(height: AppSpacing.xs),

            Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.caption.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
