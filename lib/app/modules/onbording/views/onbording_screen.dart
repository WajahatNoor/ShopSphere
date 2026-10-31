import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shop_shop_sphere/app/modules/onbording/widgets/onbording_widget.dart';
import 'package:shop_shop_sphere/app/res/app_colors.dart';
import 'package:shop_shop_sphere/app/res/app_images.dart';
import 'package:shop_shop_sphere/app/res/app_text_styles.dart';
import 'package:shop_shop_sphere/app/routes/app_routes.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          done: Text('Done', style: AppTextStyles.body.copyWith(fontSize: 18)),
          next: Text('Next', style: AppTextStyles.body.copyWith(fontSize: 18)),
          skip: Text('Skip', style: AppTextStyles.body.copyWith(fontSize: 18)),
          showNextButton: true,
          showBackButton: false,
          showSkipButton: true,
          onSkip: () {
            context.go(AppRoutes.login);
          },
          onDone: () {
            context.go(AppRoutes.login);
          },

          dotsDecorator: DotsDecorator(
            size: const Size(8, 8),
            activeSize: const Size(24, 8),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            activeColor: AppColors.primary,
          ),

          animationDuration: 500,

          pages: [
            PageViewModel(
              titleWidget: SizedBox.shrink(),
              bodyWidget: OnboardingWidget(
                image: AppImages.onbordingTwo,
                title: 'Discover the Latest Gadgets',
                description:
                    'Explore a wide range of mobile accessories and discover the latest gadgets to match your lifestyle.',
              ),
            ),
            PageViewModel(
              titleWidget: SizedBox.shrink(),
              bodyWidget: OnboardingWidget(
                image: AppImages.onbordingThree,
                title: 'Find Your Perfect Match',
                description:
                    'From stylish phone cases to wireless earbuds, '
                    'find the perfect accessories for your everyday needs.',
              ),
            ),
            PageViewModel(
              titleWidget: SizedBox.shrink(),
              bodyWidget: OnboardingWidget(
                image: AppImages.onbordingOne,
                title: 'Shopping Made Simple',
                description:
                    'Experience seamless shopping with our intuitive platform designed to make your life easier.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
