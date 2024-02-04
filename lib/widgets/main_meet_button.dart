import 'package:flutter/material.dart';
import 'package:video_conference_skytalk/utils/constants.dart';

class MainMeetButton extends StatelessWidget {

  final VoidCallback onPress;
  final IconData icon;
  final String text;
  const MainMeetButton({
    super.key,
    required this.onPress, required this.icon, required this.text
  });



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: kBlack,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 4),
                )
              ]
            ),
            child: Icon(icon, color: kTertiary, size: 30,),
          ),
          const SizedBox(height: 20,),
          Text(text, style: TextStyle(
            color: kBlack,

          ),)
        ],
      ),
    );
  }
}
