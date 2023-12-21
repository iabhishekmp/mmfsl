import 'package:flutter/material.dart';

extension SnackBarExtension on BuildContext {
  void showErrorSnackBar(String msg) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(msg),
        ),
      );
  }
}
