import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_shop_sphere/app/modules/Splash/widgets/loading_dots.dart';
import 'package:shop_shop_sphere/app/res/app_colors.dart';
import 'package:shop_shop_sphere/app/res/app_images.dart';
import 'package:shop_shop_sphere/app/res/app_spacings.dart';
import 'package:shop_shop_sphere/app/res/app_text_styles.dart';
import 'package:shop_shop_sphere/app/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplash();
  }

  void startSplash() async {
    await Future.delayed(Duration(seconds: 4));
  }

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
