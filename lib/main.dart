import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urbetrack_challenge/constants.dart';
import 'package:urbetrack_challenge/splashscreen_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SW-INVASION',
      theme: ThemeData(
        primaryColor: whiteColor,
        primarySwatch: Colors.grey
      ),
      home: const SplashScreenPage(),
    );
  }
}

