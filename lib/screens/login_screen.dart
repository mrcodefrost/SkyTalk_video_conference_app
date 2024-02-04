import 'package:flutter/material.dart';
import 'package:video_conference_skytalk/resources/auth_methods.dart';
import 'package:video_conference_skytalk/utils/constants.dart';
import 'package:video_conference_skytalk/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Join or Start a call',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: kPrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Image.asset(onboardingImage),
          ),
          CustomButton(
            text: 'Login',
            onPressed: () async {
              bool result = await _authMethods.signInWithGoogle(context);
              if(result) {
                Navigator.pushNamed(context, '/home');
              }
            },
          ),
        ],
      ),
    );
  }
}
