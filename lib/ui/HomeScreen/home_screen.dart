import 'package:flutter/material.dart';
import 'package:urbetrack_challenge/ui/HomeDrawer/home_drawer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(),
      drawer: const HomeDrawer(),
    );
  }
}

