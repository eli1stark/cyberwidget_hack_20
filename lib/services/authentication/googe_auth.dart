// Eli Stark
// DANGER ZONE
// Don't edit this file on your own
// Contact Eli please

import 'package:cyberwidget_hack_20/models/user.dart';
import 'package:cyberwidget_hack_20/services/database/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on Firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Google Sign In
  Future<User> signInGoogle() async {
    try {
      GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      AuthResult authResult = await _auth.signInWithCredential(credential);
      FirebaseUser user = authResult.user;

      // create a new document for the user with uid
      await DatabaseService(uid: user.uid).updateUserAbout({
        'username': 'username',
        'firstName': 'First Name',
        'lastName': 'Last Name',
        'signInMethod': 'google',
        'gitHub': '',
        'linkedIn': '',
        'avatar': 'assets/char_assets/c8.png',
        'background': 'assets/bg_assets/bg1.png',
      });

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Google Sign Out
  Future signOutGoogle() async {
    try {
      return await _googleSignIn.disconnect();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
