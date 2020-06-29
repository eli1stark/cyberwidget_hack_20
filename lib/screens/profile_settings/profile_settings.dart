import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberwidget_hack_20/screens/container/tabs_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ProfileSettings extends StatefulWidget {
  static const routeName = '/profile_settings';
  static const double horizontalPadding = 30;

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  TextEditingController fstname,lstname,username,github,linkedin;
  ProgressDialog pd;
  List<Widget> ls=[];
  List<Widget> ls2=[];
  var co1,co2;



  final characterImages = [
    'assets/char_assets/c1.png',
    'assets/char_assets/c2.png',
    'assets/char_assets/c3.png',
    'assets/char_assets/c4.png',
    'assets/char_assets/c5.png',
    'assets/char_assets/c6.png',
    'assets/char_assets/c7.png',
    'assets/char_assets/c8.png'
  ];
  final backgroundImages = [
    'assets/bg_assets/bg1.png',
    'assets/bg_assets/bg2.png',
    'assets/bg_assets/bg3.png',
    'assets/bg_assets/bg4.png',
    'assets/bg_assets/bg5.png',
    'assets/bg_assets/bg6.png'
  ];
  var selectedimage,slet;
  bool no1sel=false;
  bool no2sel=false;

  getupdates(){
    characterImages.forEach((element) {
      setState(() {
        ls.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  no1sel=!no1sel;
                  selectedimage=element;
                });
              },
              child: Container(
                width:100.0,
                height: 150.0,
                decoration: no1sel?BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff6F29E6),
                        spreadRadius: 4.0,
                        blurRadius: 4.0,
                        offset: Offset(0, 4),
                      )
                    ]):BoxDecoration(),
                child: Image.asset(element,fit: BoxFit.fill,),
              ),
            ),
          ),
        );
      });
    });

  }
  getupdatesforbg(){
    backgroundImages.forEach((elements) {
      setState(() {
        ls2.add(
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    no2sel=!no2sel;
                    slet=elements;
                  });
                },
                child: Container(
                  width:400,
                  height: 30.0,
                  decoration: no2sel?BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff6F29E6),
                          spreadRadius: 4.0,
                          blurRadius: 4.0,
                          offset: Offset(0, 4),
                        )
                      ]):BoxDecoration(),
                  child: Image.asset(elements,fit: BoxFit.fill,),
                ),
              ),
            ),
        );
      });
    });

  }


  @override
  void initState() {
    fstname=TextEditingController(text: "");
    lstname =TextEditingController(text: "");
    username=TextEditingController(text: "");
    github=TextEditingController(text: "");
    linkedin=TextEditingController(text: "");
    super.initState();
    getupdates();
    getupdatesforbg();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    pd = ProgressDialog(context);
    pd.style(message: 'Please wait...');
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlue,
        title: Text("Profile",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left:8.0,right:8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.0
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Avatar',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(
                    height: 20.0
                ),
                Container(
                  width: width,
                  height: height*0.15,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: ls,
                  ),
                ),
                SizedBox(
                    height: 20.0
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(no1sel?'selected':'Select Avatar',style: TextStyle(fontSize: 15.0),)
                  ],
                ),

                SizedBox(
                    height: 20.0
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Background',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(
                    height: 20.0
                ),
                Container(
                  width: width,
                  height: height*0.2,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: ls2,
                  ),
                ),
                SizedBox(
                    height: 20.0
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(no2sel?'selected':'Select background',style: TextStyle(fontSize: 15.0),)
                  ],
                ),
                SizedBox(
                    height: 20.0
                ),
                TextField(
                  controller: username,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width * 0.39,
                      child: TextField(
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        controller: fstname,
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.39,
                      child: TextField(
                        controller: lstname,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  controller: github,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Github',
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  controller: linkedin,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Linkedin',
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Container(
                  width: width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff6F29E6),
                          spreadRadius: 2.0,
                          blurRadius: 4.0,
                          offset: Offset(0, 4),
                        )
                      ]),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    onPressed: () async {
                      if (username.text.isEmpty ||
                          fstname.text.isEmpty ||
                          lstname.text.isEmpty ||
                          github.text.isEmpty ||
                          linkedin.text.isEmpty) {
                        Alert(
                            context: context,
                            type: AlertType.warning,
                            title: 'Fill all the fields',
                            buttons: [
                              DialogButton(
                                child: Text('Okay'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: Color(0xffF1009C),
                              )
                            ]).show();
                      } else if(!no1sel || !no2sel){
                        Alert(
                            context: context,
                            type: AlertType.warning,
                            title: 'Select the image',
                            buttons: [
                              DialogButton(
                                child: Text('Okay'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: Color(0xffF1009C),
                              )
                            ]).show();
                      }
                        else
                        {
                        pd.show();
                        FirebaseUser user =await FirebaseAuth.instance.currentUser();
                        var uuuid=user.uid;
                        await Firestore.instance.collection('users').document(uuuid).updateData({
                         "about":{
                           "avatar":selectedimage,
                           'background':slet,
                           'firstname':fstname.text,
                           'lastname':lstname.text,
                           'username':username.text,
                           'linkedin':linkedin.text,
                           'github':github.text,
                         }
                        }).then((value) {
                          pd.hide();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TabsScreen()));
                        }).catchError((err){
                          pd.hide();
                          Alert(
                            context: context,
                            title: 'Something wrong',
                            type: AlertType.warning,
                          ).show();

                        });

                        github.clear();
                        username.clear();
                        fstname.clear();
                        lstname.clear();
                        linkedin.clear();
                      }
                    },
                    color: Color(0xffF1009C),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*0.15,),
              ],
            ),
          ),
        ),
      ),

    );
  }
}

