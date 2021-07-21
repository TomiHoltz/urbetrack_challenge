import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urbetrack_challenge/constants.dart';
import 'package:urbetrack_challenge/models/character.dart';
import 'package:urbetrack_challenge/providers/providers.dart';
import 'package:http/http.dart' as http;

class ReportButton extends ConsumerWidget {
  const ReportButton({Key? key, required this.character}) : super(key: key);

  final Character character;

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
            http
                .post(
              Uri.parse(
                "https://jsonplaceholder.typicode.com/posts",
              ),
              body: jsonEncode(
                <String, dynamic>{
                  'userId': 10,
                  'dateTime': DateTime.now().toString(),
                  'title': "laboriosam dolor voluptates",
                  'character_name': character.name,
                },
              ),
            )
                .whenComplete(
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: darkColor,
                    behavior: SnackBarBehavior.floating,
                    content: Text(
                      "Reporte Emitido",
                      overflow: TextOverflow.fade,
                      style: GoogleFonts.lato(color: primaryColor),
                    ),
                  ),
                );
              },
            );
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
