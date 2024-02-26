import 'package:flutter/material.dart';
import 'package:video_conference_skytalk/resources/auth_methods.dart';
import 'package:video_conference_skytalk/utils/constants.dart';
import 'package:video_conference_skytalk/widgets/custom_button.dart';
import 'package:video_conference_skytalk/widgets/google_button.dart';

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
            'Welcome to SkyTalk !',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: kBlack,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Join or Start a call',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: kSecondary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Image.asset(startScreenImage),
          ),
          // CustomButton(
          //   text: 'Login',
          //   onPressed: () async {
          //     bool result = await _authMethods.signInWithGoogle(context);
          //     if (result) {
          //       Navigator.pushReplacementNamed(context, '/home');
          //     }
          //   },
          // ),
          const GoogleLoginButton(),
        ],
      ),
    );
  }
}
