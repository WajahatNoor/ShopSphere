import 'package:flutter/material.dart';
import 'package:shop_shop_sphere/app/res/app_text_styles.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(50),
          child: Image.asset(image, fit: BoxFit.contain),
        ),

        const SizedBox(height: 32),

        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.subheading,
        ),

        const SizedBox(height: 16),

        Text(
          description,
          textAlign: TextAlign.center,
          style: AppTextStyles.body,
        ),
      ],
    );
  }
}
