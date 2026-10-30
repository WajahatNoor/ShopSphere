import 'package:flutter/material.dart';
import 'package:shop_shop_sphere/app/modules/splash/widgets/loading_dots.dart';
import 'package:shop_shop_sphere/app/res/app_colors.dart';
import 'package:shop_shop_sphere/app/res/app_images.dart';
import 'package:shop_shop_sphere/app/res/app_spacings.dart';
import 'package:shop_shop_sphere/app/res/app_text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(100),
                child: Image.asset(
                  AppImages.splashImage,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(height: AppSpacing.md),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Shop', style: AppTextStyles.heading),
                    TextSpan(
                      text: 'Sphere',
                      style: AppTextStyles.heading.copyWith(
                        color: AppColors.info,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.sm),
              Text(
                'Everything you love, in one place.',
                style: AppTextStyles.body,
              ),
              SizedBox(height: AppSpacing.lg),
              LoadingDots(),
            ],
          ),
        ),
      ),
    );
  }
}
