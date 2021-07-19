import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urbetrack_challenge/constants.dart';
import 'package:urbetrack_challenge/models/character.dart';

class NameAndImage extends StatelessWidget {
  const NameAndImage({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          child: SvgPicture.asset(
            "assets/Mandalorian Helmet.svg",
          ),
          radius: 40,
        ),
        //Name
        SizedBox(height: defaultPadding),
        Text(
          character.name!,
          style: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}