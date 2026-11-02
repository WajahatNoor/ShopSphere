import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_shop_sphere/app/modules/Login/widgets/reusable_auth_widgets.dart';
import 'package:shop_shop_sphere/app/res/app_colors.dart';
import 'package:shop_shop_sphere/app/res/app_spacings.dart';
import 'package:shop_shop_sphere/app/routes/app_routes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AuthHeader(
                title: 'Forgot Password',
                subtitle:
                    'Enter your email and we will send you a reset link',
              ),
              const SizedBox(height: AppSpacing.xxl),
              const AuthTextField(
                hint: 'Email',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: AppSpacing.lg),
              AuthButton(title: 'Send Reset Link', onPressed: () {}),
              const SizedBox(height: AppSpacing.xl),
              AuthPrompt(
                question: 'Remember your password?',
                actionText: 'Sign In',
                onTap: () => context.goNamed(AppRoutes.login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
