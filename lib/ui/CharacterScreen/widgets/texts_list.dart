import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urbetrack_challenge/constants.dart';
import 'package:urbetrack_challenge/models/character.dart';

class TextsList extends StatelessWidget {
  const TextsList({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Eye Color: ${character.eyeColor!}",
          style: GoogleFonts.lato(
            fontSize: 16,
          ),
        ),
        //Gender
        const SizedBox(height: defaultPadding * 0.75),
        Text(
          "Gender: ${character.gender!}",
          style: GoogleFonts.lato(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: defaultPadding * 0.75),
        Text(
          "Hair color: ${character.hairColor!}",
          style: GoogleFonts.lato(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: defaultPadding * 0.75),
        Text(
          "Height: ${character.height!}",
          style: GoogleFonts.lato(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: defaultPadding * 0.75),
        Text(
          "Mass: ${character.mass!}",
          style: GoogleFonts.lato(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: defaultPadding * 0.75),
        Text(
          "Skin Color: ${character.skinColor!}",
          style: GoogleFonts.lato(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
