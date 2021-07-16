import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urbetrack_challenge/constants.dart';
import 'package:urbetrack_challenge/ui/HomeDrawer/widgets/drawer_banner.dart';
import 'package:urbetrack_challenge/ui/HomeDrawer/widgets/online_mode_button.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: const [
              DrawerBanner(),
              SizedBox(height: defaultPadding),
              OnlineModeButton(),
            ],
          ),
        ),
      ),
    );
  }
}


