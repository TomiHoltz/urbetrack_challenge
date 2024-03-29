import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:urbetrack_challenge/constants.dart';
import 'package:urbetrack_challenge/ui/HomeScreen/home_screen.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/icon.png'),
      title: const Text(""),
      navigator: const MyHomePage(),
      logoSize: MediaQuery.of(context).size.height * 0.125,
      showLoader: true,
      loaderColor: darkColor,
      durationInSeconds: 3,
    );
  }
}
