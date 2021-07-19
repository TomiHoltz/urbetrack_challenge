import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urbetrack_challenge/constants.dart';
import 'package:urbetrack_challenge/providers/providers.dart';
import 'package:urbetrack_challenge/ui/HomeDrawer/home_drawer.dart';
import 'package:urbetrack_challenge/ui/HomeScreen/widgets/characters_list.dart';
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
          decoration: const InputDecoration(
            hintText: "Buscar",
            suffixIcon: Icon(Icons.search),
          ),
          onChanged: (value) {
            context.read(searchResult).state = value;
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HomeTitle(),
              SizedBox(height: defaultPadding),
              CharactersList(),
              SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
      drawer: const HomeDrawer(),
    );
  }
}
