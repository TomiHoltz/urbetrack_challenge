import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urbetrack_challenge/constants.dart';
import 'package:urbetrack_challenge/models/character.dart';
import 'package:urbetrack_challenge/ui/CharacterScreen/widgets/texts_list.dart';
import 'package:urbetrack_challenge/ui/CharacterScreen/widgets/vehicles_and_straships_buttons.dart';

class InfoTexts extends StatelessWidget {
  const InfoTexts({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          TextsList(character: character),
          const SizedBox(height: defaultPadding * 0.75),
          VehiclesAndStarshipsButtons(character: character),
        ],
      ),
    );
  }
}
