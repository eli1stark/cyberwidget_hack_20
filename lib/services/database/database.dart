// Eli Stark
// DANGER ZONE
// Don't edit this file on your own
// Contact Eli please

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberwidget_hack_20/models/user.dart';

class DatabaseService {
  // constructor
  DatabaseService({this.uid});

  // user's unique id
  final String uid;

  // collection reference
  final CollectionReference users = Firestore.instance.collection('users');

  // update user data: Map(About)
  Future updateUserAbout(Map about) async {
    // if document doesn't exist yet, then Firestore create new one
    return await users.document(uid).setData({
      'about': about,
    });
  }

  // user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      about: snapshot.data['about'],
    );
  }

  // get user data
  Stream<UserData> get userData {
    return users.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
