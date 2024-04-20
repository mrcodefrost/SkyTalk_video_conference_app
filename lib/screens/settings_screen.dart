import 'package:flutter/material.dart';
import 'package:video_conference_skytalk/resources/auth_methods.dart';
import 'package:video_conference_skytalk/widgets/custom_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(text: 'Profile', onPressed: () {}),
        CustomButton(text: 'Dark Mode', onPressed: () {}),
        CustomButton(text: 'Settings', onPressed: () {}),
        CustomButton(text: 'About', onPressed: () {}),
        CustomButton(
          text: 'Sign Out',
          onPressed: () {
            AuthMethods().signOutWithGoogle(context);
          },
        )
      ],
    );
  }
}
