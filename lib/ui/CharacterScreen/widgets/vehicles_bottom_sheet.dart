import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urbetrack_challenge/constants.dart';
import 'package:urbetrack_challenge/models/character.dart';

class VehiclesBottomSheet extends StatelessWidget {
  VehiclesBottomSheet({Key? key, required this.character}) : super(key: key);

  final Character character;

  final divider = const SizedBox(
    width: 60,
    child: Divider(
      thickness: 3,
      color: darkColor,
    ),
  );

  final text = Text(
    "Vehicles",
    style: GoogleFonts.lato(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(12)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            divider,
            text,
          ],
        ),
      ),
    );
  }
}
