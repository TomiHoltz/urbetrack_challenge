import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:urbetrack_challenge/constants.dart';
import 'package:urbetrack_challenge/models/character.dart';
import 'package:urbetrack_challenge/ui/CharacterScreen/character_screen.dart';

class CharacterListTile extends StatelessWidget {
  const CharacterListTile({Key? key, required this.character})
      : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: darkColor),
          gradient: const LinearGradient(colors: [
            primaryColor,
            Colors.white,
          ])),
      margin: const EdgeInsets.only(
        bottom: 10,
        right: defaultPadding / 2,
        left: defaultPadding / 2,
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: SvgPicture.asset("assets/Mandalorian Helmet.svg"),
          backgroundColor: Colors.transparent,
        ),
        title: Text(character.name!),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Height: ${character.height!}cm"),
            Text("Mass: ${character.mass!}"),
            Text("Gender: ${character.gender!}"),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                child: CharacterScreen(character: character),
                type: PageTransitionType.rightToLeft,
              ),
            );
          },
          icon: const Icon(Icons.arrow_forward_ios, color: darkColor),
        ),
      ),
    );
  }
}
