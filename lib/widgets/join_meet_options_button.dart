import 'package:flutter/material.dart';
import 'package:video_conference_skytalk/utils/constants.dart';

class JoinMeetOptionsButton extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChange;

  const JoinMeetOptionsButton(
      {super.key,
      required this.text,
      required this.isMute,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: kBlack,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 24,
                color: kWhite,
              ),
            ),
          ),
          Switch(
            value: isMute,
            onChanged: onChange,
            inactiveThumbColor: kSecondary,
            inactiveTrackColor: kTertiary,
            activeColor: kBlack,
            activeTrackColor: kPrimary,
          )
        ],
      ),
    );
  }
}
