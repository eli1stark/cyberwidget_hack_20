
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberwidget_hack_20/screens/profile_settings/profile_settings.dart';
import 'package:cyberwidget_hack_20/screens/welcome/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cyberwidget_hack_20/services/authentication/email_auth.dart';
import 'package:cyberwidget_hack_20/services/authentication/googe_auth.dart';



class Profile extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var isloading=true;
  var ispost=false;
  final EmailAuthService _auth = EmailAuthService();
  var userid,assetsid;

  getuserdetails() async{
    FirebaseUser user=await FirebaseAuth.instance.currentUser();
    var uid=user.uid;
    await Firestore.instance.collection('users').document(uid).get().then((value){
      setState(() {
        isloading=false;
        userid=uid;
        assetsid=value.data['about']['background'];
      });
    }).catchError((err){
      print('error $err');
    });
    await Firestore.instance.collection('posts').document(uid).get().then((value){
      if(value.exists){
        setState(() {
          ispost=true;
        });
      }else{
        setState(() {
          ispost=false;
        });
      }
    }).catchError((err){
      setState(() {
        ispost=false;
      });
    });
  }

  final GoogleAuthService _googleAuth = GoogleAuthService();
  List<String> dt=['Edit profile','Signout'];


  @override
  void initState() {
    getuserdetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlue,
        title: Text("Profile",style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          PopupMenuButton<String>(
              elevation: 3.0,
              onSelected: _selected,
              itemBuilder:(BuildContext context){
                return dt.map((f){
                  return PopupMenuItem<String>(
                    value: f,
                    child: Text(f),
                  );
                }).toList();
              }
          ),
          SizedBox(width: 20.0,),
        ],
      ),
      body: isloading?Container(
        width: width,
        height: height,
        child: Center(child: Text('Loading...'),),
      ):SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: Column(
            children: [
              Container(
                width: width,
                height: height*0.35,
                child: Image.asset(assetsid,fit: BoxFit.fill,),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('My Post',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: width,
                height: height*0.5,
                child: ispost?StreamBuilder(
                  stream: Firestore.instance.collection('posts').document(userid).get().asStream(),
                  builder: (context,snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: Text('Loading...'));
                    }
                    else if(!snapshot.hasData || snapshot==null) {
                      return Center(child: Text('No Post yet'),);
                    }
                      else{
                      return ListView.builder(
                          itemCount: snapshot.data.toString().length,
                          itemBuilder: (context,index){
                            return showthepost(snapshot,width,height);
                          });

                    }
                  },
                ):Center(
                  child: Text('No Post yet'),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  Future<void> _selected(String value) async {
    if(value==dt[0]){
      Navigator.of(context)
          .pushNamed(ProfileSettings.routeName);
    }
    else if(value==dt[1]){
      FirebaseUser user=await FirebaseAuth.instance.currentUser();
      var uid=user.uid;
      await Firestore.instance.collection('users').document(uid).get().then((value) async {
        if(value.data['about']['signInMethod']=='email'){
          await _auth.signOut();

          Navigator.pushNamed(context, Welcome.routeName);
        }else{
          await _googleAuth.signOutGoogle();
          Navigator.pushNamed(context, Welcome.routeName);

        }

      }).catchError((err){

      });
    }
    else{
      print('nothing');
    }
  }

  Widget showthepost(AsyncSnapshot snapshot,double width,double height) {
    print(snapshot.data['title']);
    return Padding(
      padding: const EdgeInsets.only(top:15.0,left:10.0,right:10.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(snapshot.data['title'],style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width*0.5,
                height: height*0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff6F29E6),
                        spreadRadius: 4.0,
                        blurRadius: 4.0,
                        offset: Offset(0, 4),
                      )
                    ]),
                child: Image.network(snapshot.data['photo1'],fit: BoxFit.fill,),
              ),
              Container(
                width: width*0.5,
                height: height*0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff6F29E6),
                        spreadRadius: 4.0,
                        blurRadius: 4.0,
                        offset: Offset(0, 4),
                      )
                    ]),
                child: Image.network(snapshot.data['photo2'],fit: BoxFit.fill,),
              ),
            ],
          ),
          Row(
            children: [
              Text('Tag1 ${snapshot.data['tag1']}',style: TextStyle(fontSize: 20.0,color: Colors.white),),
              Text('Tag2 ${snapshot.data['tag2']}',style: TextStyle(fontSize: 20.0,color: Colors.white),)
            ],
          ),
        ],
      ),
    );
  }
}


