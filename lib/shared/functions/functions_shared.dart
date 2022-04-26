import 'package:flutter/material.dart';

import '../../feedBack/snackBar.dart';

class FunctionShared {
  static showSnackBar(BuildContext context, String label, Color color) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBarWidget(
        label: label,
        color: color,
      ) as SnackBar,
    );
  }
}
