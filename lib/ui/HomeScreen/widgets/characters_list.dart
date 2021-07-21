import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urbetrack_challenge/models/character.dart';
import 'package:urbetrack_challenge/providers/providers.dart';
import 'package:urbetrack_challenge/ui/HomeScreen/widgets/character_listtile.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return watch(charactersListRequest).when(
          data: (data) {
            List<CharacterListTile> list = [];
            for (var ch in data) {
              list.add(
                CharacterListTile(
                  character: Character(
                    name: ch.name,
                    eyeColor: ch.eyeColor,
                    gender: ch.gender,
                    hairColor: ch.hairColor,
                    height: ch.height,
                    mass: ch.mass,
                    skinColor: ch.skinColor,
                    homeworld: ch.homeworld,
                    vehicles: ch.vehicles,
                    starships: ch.starships
                  ),
                ),
              );
            }
            return Column(
                children: list
                    .where((element) => element.character.name!
                        .contains(watch(searchResult).state))
                    .toList());
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (_, __) => const Text("Error"),
        );
      },
    );
  }
}
