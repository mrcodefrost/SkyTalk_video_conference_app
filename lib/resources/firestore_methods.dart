import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // to fetch the data
  Stream<QuerySnapshot<Map<String, dynamic>>> get meetHistory => _firestore
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('meets')
      .snapshots();

  void addRecentMeets(String meetingName) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('meets')
          .add({
        'meetName': meetingName,
        'createdAt': DateTime.now(),
      });
    } catch (e) {
      print(e);
    }
  }
}
