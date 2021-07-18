import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urbetrack_challenge/constants.dart';
import 'package:urbetrack_challenge/models/character.dart';

class CharacterListTile extends StatelessWidget {
  const CharacterListTile({
    Key? key,
    required this.character
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: SvgPicture.asset("assets/Mandalorian Helmet.svg"),
        backgroundColor: Colors.transparent,
      ),
      title: Text(character.name!),
      subtitle: Text(character.birthYear!),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_forward_ios, color: darkColor),
      ),
    );
  }
}

