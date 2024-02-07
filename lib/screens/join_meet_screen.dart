import 'package:flutter/material.dart';
import 'package:video_conference_skytalk/resources/auth_methods.dart';
import 'package:video_conference_skytalk/resources/jitsi_meet_methods.dart';
import 'package:video_conference_skytalk/utils/constants.dart';
import 'package:video_conference_skytalk/widgets/join_meet_options_button.dart';

import '../widgets/custom_button.dart';

class JoinMeetScreen extends StatefulWidget {
  const JoinMeetScreen({super.key});

  @override
  State<JoinMeetScreen> createState() => _JoinMeetScreenState();
}

class _JoinMeetScreenState extends State<JoinMeetScreen> {
  final AuthMethods _authMethods = AuthMethods();
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  late TextEditingController roomIdController;
  late TextEditingController nameController;

  bool isAudioMute = true;
  bool isVideoOff = true;

  audioState(bool value) {
    setState(() {
      isAudioMute = value;
    });
  }

  videoState(bool value) {
    setState(() {
      isVideoOff = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    roomIdController = TextEditingController();
    nameController =
        TextEditingController(text: _authMethods.currentUser.displayName);
    super.initState();
  }

  @override
  void dispose() {
    roomIdController.dispose();
    nameController.dispose();
    super.dispose();
  }

  _joinMeeting() {
    _jitsiMeetMethods.createNewMeet(
        roomName: roomIdController.text,
        isAudioMuted: isAudioMute,
        isVideoOff: isVideoOff,
        username: nameController.text,
        subject: 'will see');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: const Text('Join a meeting'),
        titleTextStyle: TextStyle(
          fontSize: 25,
          color: kBlack,
          letterSpacing: 2,
        ),
        centerTitle: true,
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: roomIdController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                fillColor: kTertiary,
                filled: true,
                border: InputBorder.none,
                hintText: 'Room ID'),
          ),
          Container(
            color: kPrimary,
            height: 5,
            width: 10,
          ),
          TextField(
            controller: roomIdController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                fillColor: kTertiary,
                filled: true,
                border: InputBorder.none,
                hintText: 'Name'),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          JoinMeetOptionsButton(
            text: 'Mute Audio',
            isMute: isAudioMute,
            onChange: audioState,
          ),
          JoinMeetOptionsButton(
            text: 'Turn Video On',
            isMute: isVideoOff,
            onChange: videoState,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomButton(
            text: 'Join SkyTalk',
            onPressed: _joinMeeting,
          ),
        ],
      ),
    );
  }
}
