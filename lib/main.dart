import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_shop_sphere/app/res/app_text_styles.dart';
import 'package:shop_shop_sphere/app/res/app_theme.dart';
import 'package:shop_shop_sphere/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    debugPrint("FIREBASE CONNECTED");
  });
  runApp(const ShopSphereApp());
}

class ShopSphereApp extends StatelessWidget {
  const ShopSphereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      title: 'ShopSphere My  First Ecommerse App',
      home: Scaffold(
        body: Center(
          child: Text("Hello from shopspheres", style: AppTextStyles.heading),
        ),
      ),
    );
  }
}
