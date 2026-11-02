import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_shop_sphere/app/res/app_theme.dart';
import 'package:shop_shop_sphere/app/routes/app_pages.dart';
import 'package:shop_shop_sphere/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
    return MaterialApp.router(
      routerConfig: AppPages.appRoutes,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      title: 'ShopSphere My  First Ecommerse App',
    );
  }
}
