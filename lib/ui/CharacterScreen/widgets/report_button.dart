import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urbetrack_challenge/constants.dart';
import 'package:urbetrack_challenge/providers/providers.dart';

class ReportButton extends ConsumerWidget {
  const ReportButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: () {
          if (watch(isOnlineActive).state == false) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: darkColor,
                behavior: SnackBarBehavior.floating,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Activa el modo online",
                      overflow: TextOverflow.fade,
                      style: GoogleFonts.lato(color: primaryColor),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.read(isOnlineActive).state = true;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: darkColor,
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              "Modo Online Activado",
                              overflow: TextOverflow.fade,
                              style: GoogleFonts.lato(color: primaryColor),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Activar",
                        style: GoogleFonts.lato(color: primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            
          }
        },
        child: Text(
          "Emitir reporte",
          style: GoogleFonts.lato(color: darkColor),
        ),
      ),
    );
  }
}
