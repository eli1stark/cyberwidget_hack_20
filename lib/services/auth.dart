// Firebase auth logic


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
         await Firestore.instance.collection('Userdetails').add({
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