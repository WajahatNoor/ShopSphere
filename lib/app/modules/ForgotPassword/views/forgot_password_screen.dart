import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_shop_sphere/app/modules/Auth/bloc/auth_bloc.dart';
import 'package:shop_shop_sphere/app/modules/Login/widgets/reusable_auth_widgets.dart';
import 'package:shop_shop_sphere/app/res/app_colors.dart';
import 'package:shop_shop_sphere/app/res/app_spacings.dart';
import 'package:shop_shop_sphere/app/routes/app_routes.dart';
import 'package:shop_shop_sphere/app/utils/app_loader.dart';
import 'package:shop_shop_sphere/app/utils/form_validations.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emaiController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void doForgotPassword() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    final email = emaiController.text.trim();
    context.read<AuthBloc>().add(ForgotPasswordRequested(email: email));
  }

  @override
  void dispose() {
    emaiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext wcontext) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ForgotPasswordLoadingState) {
            AppLoader.showLoaderWithDialog();
          }

          if (state is ForgotPasswordSuccessState) {
            AppLoader.hideLoader();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Password reset email sent successfully. Please check your inbox",
                ),
              ),
            );
            wcontext.goNamed(AppRoutes.login);
          }
          if (state is ForgotPasswordErrorState) {
            AppLoader.hideLoader();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          return SafeArea(
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
                      title: 'Forgot Password',
                      subtitle:
                          'Enter your email and we will send you a reset link',
                    ),
                    const SizedBox(height: AppSpacing.xxl),
                    AuthTextField(
                      hint: 'Email',
                      controller: emaiController,
                      validator: Validators.emailLoginValidator,
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    AuthButton(
                      title: 'Send Reset Link',
                      onPressed: state is ForgotPasswordLoadingState
                          ? () {}
                          : () {
                              doForgotPassword();
                            },
                    ),
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
        },
      ),
    );
  }
}
