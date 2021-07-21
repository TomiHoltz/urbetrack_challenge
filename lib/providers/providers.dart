import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urbetrack_challenge/models/character.dart';
import 'package:http/http.dart' as http;

final StateProvider<bool> isOnlineActive = StateProvider<bool>((ref) => true);

final FutureProvider<List<Character>> charactersListRequest =
    FutureProvider<List<Character>>(
  (ref) async {
    List<Character> chList = [];

    for (var i = 1; i < 6; i++) {
      final response =
          await http.get(Uri.parse("https://swapi.dev/api/people/?page=$i"));

      if (response.statusCode == 200) {
        String body = utf8.decode(response.bodyBytes);
        final jsonData = jsonDecode(body);
        final data = jsonData["results"];

        for (var character in data) {

          final List<String> vehiclesList = [];
          final List<String> starshipsList = [];

          for (var vehicle in character["vehicles"]) {
            final vehicleResponse =
                await http.get(Uri.parse(vehicle.toString()));
            String vehicleBody = utf8.decode(vehicleResponse.bodyBytes);
            final vehicleJsonData = jsonDecode(vehicleBody);
            vehiclesList.add(vehicleJsonData["name"]);
          }

          for (var starship in character["starships"]) {
            final starshipResponse =
                await http.get(Uri.parse(starship.toString()));
            String starshipBody = utf8.decode(starshipResponse.bodyBytes);
            final starshipJsonData = jsonDecode(starshipBody);
            starshipsList.add(starshipJsonData["name"]);
          }

          final homeworldResponse =
                await http.get(Uri.parse(character["homeworld"]));
          String homeworldBody = utf8.decode(homeworldResponse.bodyBytes);
          final homeworldJsonData = jsonDecode(homeworldBody);

          chList.add(
            Character(
              name: character["name"] as String,
              eyeColor: character["eye_color"] as String,
              gender: character["gender"] as String,
              hairColor: character["hair_color"] as String,
              height: character["height"] as String,
              mass: character["mass"] as String,
              skinColor: character["skin_color"] as String,
              homeworld: homeworldJsonData["name"],
              vehicles: vehiclesList.isEmpty ? [] : vehiclesList,
              starships: starshipsList.isEmpty ? [] : starshipsList,
            ),
          );
        }
      } else {
        return [Character(name: "Error")];
      }
    }
    return chList;
  },
);

final StateProvider<String> searchResult = StateProvider<String>((ref) => "");
