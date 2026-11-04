import 'package:flutter/material.dart';
import 'package:shop_shop_sphere/app/res/app_colors.dart';

class AppLoader {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static bool _isShowing = false;

  static void showLoaderWithDialog() {
    if (_isShowing) return;

    final context = navigatorKey.currentContext;

    if (context == null) {
      debugPrint('AppLoader: Navigator context is null');
      return;
    }

    _isShowing = true;

    showDialog(
      context: context,
      useRootNavigator: true,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.35),
      builder: (dialogContext) {
        return PopScope(
          canPop: false,
          child: Center(
            child: SizedBox(
              width: 75,
              height: 75,
              child: Card(
                color: Colors.white,
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeWidth: 3,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ).whenComplete(() {
      _isShowing = false;
    });
  }

  static void hideLoader() {
    if (!_isShowing) return;

    final context = navigatorKey.currentContext;

    if (context == null) return;

    Navigator.of(context, rootNavigator: true).pop();
  }
}
