import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urbetrack_challenge/constants.dart';
import 'package:urbetrack_challenge/models/character.dart';

class StarshipsBottomSheet extends StatelessWidget {
  StarshipsBottomSheet({Key? key, required this.character}) : super(key: key);

  final Character character;

  final divider = const SizedBox(
    width: 60,
    child: Divider(
      thickness: 3,
      color: darkColor,
    ),
  );

  final text = Text(
    "Starships",
    style: GoogleFonts.lato(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  );

  Widget vehiclesList() {
    List<Widget> listItems = [];
    if (character.starships!.isNotEmpty) {
      for (var starships in character.starships!) {
        listItems.add(
          starshipsListTile(starships!),
        );
      }
    } else {
      listItems.add(
        Center(
          child: Column(
            children: [
              const SizedBox(height: defaultPadding / 2),
              Text("${character.name} hasn't got any starship"),
            ],
          ),
        ),
      );
    }
    return Column(children: listItems);
  }

  Widget starshipsListTile(String starship) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(defaultPadding / 2),
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
        border: Border.all(color: darkColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        starship.toString(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(12)),
      child: SingleChildScrollView(
        child: Column(
          children: [divider, text, vehiclesList()],
        ),
      ),
    );
  }
}
