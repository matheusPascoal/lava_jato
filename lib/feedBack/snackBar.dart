import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SnackBarWidget extends StatelessWidget {
  final String? label;
  final Color? color;
  const SnackBarWidget({Key? key, this.label, this.color}) : super(key: key);

  @override
  SnackBar build(BuildContext context) {
    return SnackBar(
        backgroundColor: color!,
        content: Text(
          label!,
          textAlign: TextAlign.center,
          style: GoogleFonts.varelaRound(
              fontSize: 22, fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 500),
        elevation: 10);
  }
}
