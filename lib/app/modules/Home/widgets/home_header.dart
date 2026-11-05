import 'package:flutter/material.dart';
import 'package:shop_shop_sphere/app/res/app_colors.dart';
import 'package:shop_shop_sphere/app/res/app_spacings.dart';
import 'package:shop_shop_sphere/app/res/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back, Wajahat👋', style: AppTextStyles.bodySmall),
            const SizedBox(height: AppSpacing.xs),
            Text("Discover What's New", style: AppTextStyles.sectionHeading),
          ],
        ),
        IconButton(
          onPressed: () {
            // Navigate to notifications
          },
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: AppColors.primary,
            size: 27,
          ),
        ),
      ],
    );
  }
}
