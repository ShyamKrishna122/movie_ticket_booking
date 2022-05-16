import 'package:flutter/material.dart';

class Utils {
  static snackBar({
    required String message,
    required BuildContext context,
  }) {
    SnackBar snackBar = SnackBar(
      content: Text(
        message,
      ),
    );
    return ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }
}
