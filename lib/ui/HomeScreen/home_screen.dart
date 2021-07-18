import 'package:flutter/material.dart';
import 'package:urbetrack_challenge/constants.dart';
import 'package:urbetrack_challenge/models/character.dart';
import 'package:urbetrack_challenge/ui/HomeDrawer/home_drawer.dart';
import 'package:urbetrack_challenge/ui/HomeScreen/widgets/character_listtile.dart';
import 'package:urbetrack_challenge/ui/HomeScreen/widgets/home_title.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          cursorColor: primaryColor,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            hintText: "Buscar",
            suffixIcon: Icon(Icons.search),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTitle(),
              const SizedBox(height: defaultPadding),
              CharacterListTile(
                character: Character(
                  name: "Yoda",
                  birthYear: "1000"
                ),
              )
            ],
          ),
        ),
      ),
      drawer: const HomeDrawer(),
    );
  }
}