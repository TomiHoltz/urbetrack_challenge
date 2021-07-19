import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urbetrack_challenge/models/character.dart';
import 'package:http/http.dart' as http;

final StateProvider<bool> isOnlineActive = StateProvider<bool>((ref) => false);

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
        List<String> vehicles = [];
        List<String> starships = [];

        for (var character in data) {
          for (var vehicleUrl in character["vehicles"]) {
            if ((vehicleUrl as String).isNotEmpty) {
              final vehicleResponse = await http.get(Uri.parse(vehicleUrl));
              String vehicleBody = utf8.decode(vehicleResponse.bodyBytes);
              final vehicleJsonData = jsonDecode(vehicleBody);
              vehicles.add(vehicleJsonData["name"]);
            }
          }
          for (var starshipUrl in character["starships"]) {
            if ((starshipUrl as String).isNotEmpty) {
              final starshipsResponse = await http.get(Uri.parse(starshipUrl));
              String starshipBody = utf8.decode(starshipsResponse.bodyBytes);
              final starshipJsonData = jsonDecode(starshipBody);
              starships.add(starshipJsonData["name"]);
            }
          }

          chList.add(
            Character(
              name: character["name"] as String,
              birthYear: character["birth_year"] as String,
              eyeColor: character["eye_color"] as String,
              gender: character["gender"] as String,
              hairColor: character["hair_color"] as String,
              height: character["height"] as String,
              mass: character["mass"] as String,
              skinColor: character["skin_color"] as String,
              homeworld: character["homeworld"] as String,
              vehicles: vehicles,
              starships: starships,
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
