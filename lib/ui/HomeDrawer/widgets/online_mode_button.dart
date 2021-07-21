import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urbetrack_challenge/constants.dart';
import 'package:urbetrack_challenge/providers/providers.dart';

class OnlineModeButton extends StatelessWidget {
  const OnlineModeButton({
    Key? key,
  }) : super(key: key);

  SnackBar floatingSnackBar(String text) {
    return SnackBar(
      backgroundColor: darkColor,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              text,
              overflow: TextOverflow.fade,
              style: GoogleFonts.lato(color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Modo Online"),
      trailing: Consumer(
        builder: (context, watch, child) {
          return Switch(
            value: watch(isOnlineActive).state,
            activeColor: primaryColor,
            onChanged: (bool value) {
              watch(isOnlineActive).state = value;
              if (value == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  floatingSnackBar("Se activo el modo online"),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  floatingSnackBar("Se desactivo el modo online"),
                );
              }
            },
          );
        },
      ),
    );
  }
}
