import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urbetrack_challenge/constants.dart';

class ReportButton extends StatelessWidget {
  const ReportButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(12)),
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Emitir reporte",
          style: GoogleFonts.lato(color: darkColor),
        ),
      ),
    );
  }
}
