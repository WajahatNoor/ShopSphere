import 'package:go_router/go_router.dart';
import 'package:shop_shop_sphere/app/modules/ForgotPassword/views/forgot_password_screen.dart';
import 'package:shop_shop_sphere/app/modules/Login/views/login_screen.dart';
import 'package:shop_shop_sphere/app/modules/Register/views/register_screen.dart';
import 'package:shop_shop_sphere/app/modules/Onbording/views/onbording_screen.dart';
import 'package:shop_shop_sphere/app/modules/Splash/views/splash_screen.dart';
import 'package:shop_shop_sphere/app/routes/app_routes.dart';

class AppPages {
  static final appRoutes = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onbording',
        name: AppRoutes.onbording,
        builder: (context, state) => const OnbordingScreen(),
      ),
      GoRoute(
        path: '/login',
        name: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: AppRoutes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        name: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
    ],
  );
}
