import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_shop_sphere/app/modules/Login/widgets/reusable_auth_widgets.dart';
import 'package:shop_shop_sphere/app/res/app_colors.dart';
import 'package:shop_shop_sphere/app/res/app_spacings.dart';
import 'package:shop_shop_sphere/app/routes/app_routes.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                title: 'Create Account',
                subtitle: 'Sign up to start shopping on ShopSphere',
              ),
              const SizedBox(height: AppSpacing.xxl),
              const AuthTextField(
                hint: 'Full Name',
                icon: Icons.person_outline,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppSpacing.md),
              const AuthTextField(
                hint: 'Email',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppSpacing.md),
              const AuthTextField(
                hint: 'Password',
                icon: Icons.lock_outline,
                obscureText: true,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppSpacing.md),
              const AuthTextField(
                hint: 'Confirm Password',
                icon: Icons.lock_outline,
                obscureText: true,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: AppSpacing.lg),
              AuthButton(title: 'Sign Up', onPressed: () {}),
              const SizedBox(height: AppSpacing.lg),
              const AuthDivider(),
              const SizedBox(height: AppSpacing.lg),
              GoogleSignInButton(onPressed: () {}),
              const SizedBox(height: AppSpacing.xl),
              AuthPrompt(
                question: 'Already have an account?',
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
