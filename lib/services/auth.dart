// Firebase auth logic

import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class firebaseauth{

  Future <bool> signinauth(String email, String pswd) async{
    try {
      AuthResult res = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pswd);
      FirebaseUser user=res.user;
      if(user!=null){
        return true;
      }else{
        return false;
      }
    }catch(e){
      print(e.message);
      return false;
    }
  }

  Future <bool> Signupuser(String email, String pswd,String username,String fstname,String lstname) async{
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pswd).then((value) async{
            FirebaseUser user=await FirebaseAuth.instance.currentUser();
            var uid=user.uid;
         await Firestore.instance.collection('USERS').document('User').collection('About').document(uid).setData({
           "UserID":uid,'Username':username,'first name':fstname,'last name':lstname,'email':email
         }).then((value) {
           return true;
         }).catchError((err){
           return false;
         });
      }).catchError((err){
        return false;
      });
    }catch(e){
      print(e);
      return false;
    }
  }

}


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

FirebaseUser firebaseUser;
Future<bool> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;
  final FirebaseUser currentUser = await _auth.currentUser();
  var uid=currentUser.uid;
  if(!user.isAnonymous ||await user.getIdToken() != null ||user.uid == currentUser.uid){
    return false;
  }
  else{
    await Firestore.instance.collection('USERS').document('User').collection('About').document(uid).setData({
      "UserID":uid,'Username':currentUser.displayName,'email':currentUser.email,'photourl':currentUser.photoUrl
    }).then((value) {
      return true;
    }).catchError((err){
      return false;
    });
  }

}
void signOutGoogle() async{
  await googleSignIn.signOut();
}
