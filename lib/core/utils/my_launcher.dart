import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'common_snackbar.dart';

abstract class MyLauncher {
  /// call app launcher for the app
  static Future<void> call(BuildContext context, String number) async {
    log('tel:$number', name: ' Launching Call ');
    final parsedNumber = Uri(
      scheme: 'tel',
      path: number,
    );
    if (!await launchUrl(parsedNumber)) {
      if (context.mounted) {
        context.showErrorSnackBar("Can't launch call");
      }
    }
  }
}
