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

        for (var character in data) {
          chList.add(Character(name: character["name"]));
        }
      } else {
        return [Character(name: "Error")];
      }
    }
    return chList;
  },
);

final StateProvider<String> searchResult = StateProvider<String>((ref) => "");
