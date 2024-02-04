import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:video_conference_skytalk/resources/firestore_methods.dart';

class RecentMeetsScreen extends StatelessWidget {
  const RecentMeetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirestoreMethods().meetHistory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: (snapshot.data! as dynamic).docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetName']}'),
                  subtitle: Text(
                      'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}'),
                );
              });
        });
  }
}
