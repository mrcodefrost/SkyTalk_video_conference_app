import 'package:flutter/material.dart';
import 'package:video_conference_skytalk/resources/auth_methods.dart';
import 'package:video_conference_skytalk/utils/constants.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 40,
        child: ElevatedButton(
          onPressed: () async {
            bool result = await AuthMethods().signInWithGoogle(context);
            if (result) {
              Navigator.pushReplacementNamed(context, '/home');
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                googleLogo,
                scale: 3,
              ),
              const SizedBox(
                width: 15,
              ),
              const Text('Login with Google'),
            ],
          ),
        ),
      ),
    );
  }
}
