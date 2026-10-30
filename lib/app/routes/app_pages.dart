import 'package:go_router/go_router.dart';
import 'package:shop_shop_sphere/app/modules/splash/views/splash_screen.dart';
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
    ],
  );
}
