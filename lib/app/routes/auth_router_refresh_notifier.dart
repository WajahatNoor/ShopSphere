import 'dart:async';
import 'package:flutter/material.dart';

class AuthRouterRefreshNotifier extends ChangeNotifier {
  late final StreamSubscription _subscription;

  AuthRouterRefreshNotifier(Stream stream) {
    _subscription = stream.listen((_) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
