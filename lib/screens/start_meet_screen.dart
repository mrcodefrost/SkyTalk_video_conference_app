import 'dart:math';

import 'package:flutter/material.dart';
import 'package:video_conference_skytalk/resources/auth_methods.dart';
import 'package:video_conference_skytalk/resources/jitsi_meet_methods.dart';
import 'package:video_conference_skytalk/utils/constants.dart';
import 'package:video_conference_skytalk/widgets/main_meet_button.dart';

class StartMeetsScreen extends StatelessWidget {
  StartMeetsScreen({
    super.key,
  });

  final AuthMethods _authMethods = AuthMethods();
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  void startNewMeet() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 100000).toString();
    String subject = 'Will Decide';
    _jitsiMeetMethods.createNewMeet(
        roomName: roomName,
        subject: subject,
        isAudioMuted: true,
        isVideoOff: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/join-meet');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              'Let\'s do a SkyTalk now !',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: kSecondary,
                fontSize: 30,
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainMeetButton(
                onPress: startNewMeet,
                icon: Icons.video_call,
                text: 'New Meeting',
              ),
              MainMeetButton(
                onPress: () {
                  joinMeeting(context);
                },
                icon: Icons.add_box,
                text: 'Join Meeting',
              ),
              // MainMeetButton(onPress: () {}, icon: Icons.calendar_month, text: 'Schedule Meeting',),
              MainMeetButton(
                onPress: () {
                  _authMethods.signOutWithGoogle(context);
                },
                icon: Icons.arrow_left,
                text: 'Sign Out',
              ),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      ],
    );
  }
}
