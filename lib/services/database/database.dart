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
    // if document doesn't exist yey, then Firestore create new one
    return await users.document(uid).setData({
      'about': about,
    });
  }

  // user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      about: snapshot.data['about'],
      // to be continued
    );
  }

  // get user data
  Stream<UserData> get userData {
    return users.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}

// document reference
final DocumentReference _userDocument =
    Firestore.instance.document('users/5wONbu7gzq4GPbsvxMj8');

// get data from user's document
getCategories() async {
  final messages = await _userDocument.get();
  print('READ');
  return messages.data['categories'];
}

// update 'categories' in in user's document
updateCategories(List newCategories) {
  _userDocument.updateData({
    'categories': newCategories,
  });
  print('success');
}

// // process categories from Firestore
// void processCategories() async {
//   categories = await DatabaseService().getCategories();
//   print('check: $categories');
//   setState(() => loader = false);
// }

//  // update Firestore
// DatabaseService().updateCategories(categories);
// setState(() {});
