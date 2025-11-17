import 'package:flutter/material.dart';

class RateLimitedSnackbar {
  static DateTime? _lastShown;

  static void show(BuildContext context, String message) {
    final now = DateTime.now();
    if (_lastShown == null || now.difference(_lastShown!) > const Duration(seconds: 7)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
      _lastShown = now;
    }
  }
}
