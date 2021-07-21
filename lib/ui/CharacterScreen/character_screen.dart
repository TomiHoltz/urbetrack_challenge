import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urbetrack_challenge/constants.dart';
import 'package:urbetrack_challenge/models/character.dart';
import 'package:urbetrack_challenge/ui/CharacterScreen/widgets/info_texts.dart';
import 'package:urbetrack_challenge/ui/CharacterScreen/widgets/name_and_image.dart';
import 'package:urbetrack_challenge/ui/CharacterScreen/widgets/report_button.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              NameAndImage(character: character),
              const SizedBox(height: defaultPadding),
              InfoTexts(character: character),
              const SizedBox(height: defaultPadding),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: ReportButton(character: character),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
