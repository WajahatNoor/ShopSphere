import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_shop_sphere/app/modules/Auth/bloc/auth_bloc.dart';
import 'package:shop_shop_sphere/app/modules/Login/widgets/reusable_auth_widgets.dart';
import 'package:shop_shop_sphere/app/res/app_colors.dart';
import 'package:shop_shop_sphere/app/res/app_spacings.dart';
import 'package:shop_shop_sphere/app/routes/app_routes.dart';
import 'package:shop_shop_sphere/app/utils/form_validations.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();

  final fullNameController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void doSignup() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final fullName = fullNameController.text.trim();
    context.read<AuthBloc>().add(
      RegistoredRquested(email: email, fullname: fullName, password: password),
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
            key: formKey,
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
                  validator: Validators.validateName,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: AppSpacing.md),
                AuthTextField(
                  hint: 'Email',
                  icon: Icons.email_outlined,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validateEmail,
                ),
                const SizedBox(height: AppSpacing.md),
                AuthTextField(
                  hint: 'Password',
                  icon: Icons.lock_outline,
                  controller: passwordController,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validatePassword,
                ),
                const SizedBox(height: AppSpacing.md),
                AuthTextField(
                  hint: 'Confirm Password',
                  icon: Icons.lock_outline,
                  controller: confirmPasswordController,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  validator: (value) => Validators.validateConfirmPassword(
                    value: value,
                    password: confirmPasswordController.text,
                  ),
                ),

                const SizedBox(height: AppSpacing.lg),
                AuthButton(title: 'Sign Up', onPressed: doSignup),
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
      ),
    );
  }
}
