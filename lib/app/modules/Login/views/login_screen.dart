import 'package:flutter/material.dart';
import 'package:shop_shop_sphere/app/res/app_text_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Login Screen', style: AppTextStyles.heading),
        ),
      ),
    );
  }
}
