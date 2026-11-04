import 'package:go_router/go_router.dart';
import 'package:shop_shop_sphere/app/modules/Auth/bloc/auth_bloc.dart';
import 'package:shop_shop_sphere/app/modules/ForgotPassword/views/forgot_password_screen.dart';
import 'package:shop_shop_sphere/app/modules/Home/views/home_screen.dart';
import 'package:shop_shop_sphere/app/modules/Login/views/login_screen.dart';
import 'package:shop_shop_sphere/app/modules/Register/views/register_screen.dart';
import 'package:shop_shop_sphere/app/modules/Onbording/views/onbording_screen.dart';
import 'package:shop_shop_sphere/app/modules/Splash/views/splash_screen.dart';
import 'package:shop_shop_sphere/app/routes/app_routes.dart';
import 'package:shop_shop_sphere/app/routes/auth_router_refresh_notifier.dart';
import 'package:shop_shop_sphere/app/utils/app_loader.dart';

class AppPages {
  static GoRouter createRouter(AuthBloc authBloc) {
    return GoRouter(
      navigatorKey: AppLoader.navigatorKey,
      refreshListenable: AuthRouterRefreshNotifier(authBloc.stream),
      redirect: (context, state) {
        final authState = authBloc.state;
        final isSplash = state.matchedLocation == '/';
        final isAuthPage =
            state.matchedLocation == '/login' ||
            state.matchedLocation == '/register' ||
            state.matchedLocation == '/forgot-password';

        if (authState is AuthInitial) {
          return isSplash ? null : '/';
        }

        if (authState is AuthenticatedState) {
          return isSplash || isAuthPage ? '/home' : null;
        }

        if (authState is UnAuthenticatedState) {
          return isAuthPage ? null : '/login';
        }

        return null;
      },
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
          builder: (context, state) => RegisterScreen(),
        ),
        GoRoute(
          path: '/forgot-password',
          name: AppRoutes.forgotPassword,
          builder: (context, state) => const ForgotPasswordScreen(),
        ),

        GoRoute(
          path: '/home',
          name: AppRoutes.home,
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
  }
}
