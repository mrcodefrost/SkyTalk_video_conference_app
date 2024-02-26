import 'package:flutter/material.dart';
import 'package:video_conference_skytalk/resources/auth_methods.dart';
import 'package:video_conference_skytalk/screens/recent_meets.dart';
import 'package:video_conference_skytalk/screens/settings_screen.dart';
import 'package:video_conference_skytalk/screens/start_meet_screen.dart';
import 'package:video_conference_skytalk/utils/constants.dart';
import 'package:video_conference_skytalk/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageNumber = 0; // original condition
  onPageChange(int pageNumber) {
    setState(() {
      _pageNumber = pageNumber; // new condition updated
    });
  }

  List<Widget> pages = [
    StartMeetsScreen(),
    const RecentMeetsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        elevation: 0,
        title: const Text('SkyTalk'),
        titleTextStyle:
            TextStyle(color: kBlack, fontSize: 30, letterSpacing: 3),
        centerTitle: true,
      ),
      body: pages[_pageNumber],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: kTertiary,
        selectedItemColor: kBlack,
        unselectedItemColor: kSecondary,
        onTap: onPageChange,
        currentIndex: _pageNumber,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank), label: 'Meet'),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: 'Recent Meets'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
      ),
    );
  }
}
