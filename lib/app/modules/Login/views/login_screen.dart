import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_shop_sphere/app/modules/Auth/bloc/auth_bloc.dart';
import 'package:shop_shop_sphere/app/modules/Login/widgets/reusable_auth_widgets.dart';
import 'package:shop_shop_sphere/app/res/app_colors.dart';
import 'package:shop_shop_sphere/app/res/app_spacings.dart';
import 'package:shop_shop_sphere/app/res/app_text_styles.dart';
import 'package:shop_shop_sphere/app/routes/app_routes.dart';
import 'package:shop_shop_sphere/app/utils/form_validations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void doLogin() {
    if (!formkey.currentState!.validate()) {
      return;
    }

    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    context.read<AuthBloc>().add(
      LoginRequested(email: email, password: password),
    );
  }

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
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AuthHeader(
                  title: 'Welcome Back',
                  subtitle: 'Sign in to your ShopSphere account',
                ),
                const SizedBox(height: AppSpacing.xxl),
                AuthTextField(
                  hint: 'Email',
                  validator: Validators.emailLoginValidator,
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: AppSpacing.md),
                AuthTextField(
                  hint: 'Password',
                  icon: Icons.lock_outline,
                  validator: Validators.passwordLoginValidator,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () =>
                        context.pushNamed(AppRoutes.forgotPassword),
                    child: Text(
                      'Forgot Password?',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                AuthButton(title: 'Sign In', onPressed: doLogin),
                const SizedBox(height: AppSpacing.lg),
                const AuthDivider(),
                const SizedBox(height: AppSpacing.lg),
                GoogleSignInButton(onPressed: () {}),
                const SizedBox(height: AppSpacing.xl),
                AuthPrompt(
                  question: "Don't have an account?",
                  actionText: 'Sign Up',
                  onTap: () => context.pushNamed(AppRoutes.register),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
