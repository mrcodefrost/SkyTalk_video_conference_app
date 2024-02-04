import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:video_conference_skytalk/resources/auth_methods.dart';
import 'package:video_conference_skytalk/resources/firestore_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final JitsiMeet _jitsiMeet = JitsiMeet();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();

  void createNewMeet(
      {required String roomName,
      required String subject,
      required bool isAudioMuted,
      required bool isVideoOff,
      String username = ''}) async {
    try {
      if (username.isEmpty) {
        username = _authMethods.currentUser.displayName!;
      }

      var options = JitsiMeetConferenceOptions(
        serverURL: "https://meet.jit.si",
        room: roomName,
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoOff,
          "subject": subject,
        },
        featureFlags: {"unsaferoomwarning.enabled": false},
        userInfo: JitsiMeetUserInfo(
          displayName: username,
          email: _authMethods.currentUser.email,
        ),
      );

      _firestoreMethods.addRecentMeets(roomName);
      await _jitsiMeet.join(options);
    } catch (e) {
      print(e);
    }
  }
}
