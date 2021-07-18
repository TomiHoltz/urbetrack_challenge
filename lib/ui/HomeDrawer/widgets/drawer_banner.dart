import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerBanner extends StatelessWidget {
  const DrawerBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 5),
          height: 100,
          width: double.infinity,
          child: SvgPicture.asset(
            "assets/Mandalorian Helmet.svg",
          ),
        ),
        Text(
          "SW-INVASION",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
      ],
    );
  }
}
