import 'package:flutter/material.dart';
import 'package:urbetrack_challenge/models/character.dart';
import 'package:urbetrack_challenge/ui/CharacterScreen/widgets/custom_button.dart';
import 'package:urbetrack_challenge/ui/CharacterScreen/widgets/info_texts.dart';
import 'package:urbetrack_challenge/ui/CharacterScreen/widgets/vehicles_bottom_sheet.dart';

class VehiclesAndStarshipsButtons extends StatelessWidget {
  const VehiclesAndStarshipsButtons({
    Key? key,
    required this.character
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
          text: "VEHICLES",
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return VehiclesBottomSheet(character: character);
              },
            );
          },
        ),
        CustomButton(
          text: "STARSHIPS",
          onPressed: () {},
        ),
      ],
    );
  }
}
