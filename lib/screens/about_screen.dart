import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: const Column(
        children: [
          Text('Developed by Daksh Nauni \n mr.codefrost@gmail.com'),
        ],
      ),
    );
  }
}
