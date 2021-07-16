import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urbetrack_challenge/constants.dart';

final StateProvider<bool> isOnlineActive = StateProvider<bool>((ref) => false);

class OnlineModeButton extends StatelessWidget {
  const OnlineModeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Modo Online"),
      trailing: Consumer(
        builder: (context, watch, child) {
          return Switch(
            value: watch(isOnlineActive).state,
            activeColor: primaryColor,
            onChanged: (bool value) {
              watch(isOnlineActive).state = value;
            },
          );
        },
      ),
    );
  }
}
