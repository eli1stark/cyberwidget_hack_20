
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberwidget_hack_20/components/top_navbar.dart';
import 'package:cyberwidget_hack_20/screens/chat_page/chat_page.dart';
import 'package:cyberwidget_hack_20/screens/profile_settings/profile_settings.dart';
import 'package:cyberwidget_hack_20/screens/welcome/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cyberwidget_hack_20/services/authentication/email_auth.dart';
import 'package:cyberwidget_hack_20/services/authentication/googe_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';



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
  List<Widget> ls=[];
  bool somethingerror=false;



  getpostname() async{
    FirebaseUser user=await FirebaseAuth.instance.currentUser();
    var myuidva=user.uid;
    await Firestore.instance.collection('posts').document(myuidva).collection('mypost').getDocuments()
    .then((value) {
      print(value);
      value.documents.forEach((element) {
        print(element.data['title']);
        setState(() {
          ls.add(
              Padding(
                padding: const EdgeInsets.only(left:10.0,right:10.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>statusbar(element)));
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Project Name: ${element.data['title']}',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 140,
                            height: 280,
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
                            child: Image.network(element.data['photo1'],fit: BoxFit.fill,),
                          ),
                          Container(
                            width: 140,
                            height: 280,
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
                            child: Image.network(element.data['photo2'],fit: BoxFit.fill,),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0,),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: [
//                        Text('Tag1',style: TextStyle(fontSize: 20.0,color: Colors.white),),
//                        SizedBox(width: 20.0,),
//                        Text(element.data['tag1'],style: TextStyle(fontSize: 12.0,color: Colors.white),)
//                      ],
//                    ),
//                    SizedBox(height: 20.0,),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: [
//                        Text('Tag2',style: TextStyle(fontSize: 20.0,color: Colors.white),),
//                        SizedBox(width: 20.0,),
//                        Text(element.data['tag2'],style: TextStyle(fontSize: 12.0,color: Colors.white),)
//                      ],
//                    ),

                    ],
                  ),
                ),
              ),
          );
        });

      });
    }).catchError((err){
      setState(() {
        somethingerror=true;
      });
    });
  }

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
    await Firestore.instance.collection('posts').document(uid).collection('mypost').getDocuments().then((value){
      if(value.documents.isNotEmpty){
        setState(() {
          ispost=true;
        });
      }else{
        setState(() {
          print(uid);
          print('something wrong');
          ispost=false;
        });
      }
    }).catchError((err){
      setState(() {
        print(err);
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
    getpostname();
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
      ):Container(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width,
                height: 250,
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
              ispost?
              Column(
                children: ls,
              ):Center(
                child: Text('No Post yet'),
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

}


class statusbar extends StatefulWidget {
  var str;
  statusbar(this.str);
  @override
  _statusbarState createState() => _statusbarState();
}

class _statusbarState extends State<statusbar> {
  ProgressDialog pd;

  @override
  void initState() {
    print(widget.str);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    pd=ProgressDialog(context);
    pd.style(message: 'Loading...');
    return Scaffold(
      appBar: PreferredSize(
        child: TopNavBar(
          iconLeft: Icons.arrow_back,
          iconRight: FontAwesomeIcons.paperPlane,
          fontAwesomeLeft: false,
          fontAwesomeRight: true,
          textButtonVisibility: false,
          centerTitle: true,
          title: Text(
            "CYBERWIDGET",
            style: TextStyle(
              color: Colors.white,
            ),
            //have to add font family "edo" or "cyberpunk" in pubspec and stylize this
          ),
          onTapLeft: () {
            setState(() {
              // here should be a function to exit the app
            });
          },
          onTapRight: () {
            setState(() {
              Navigator.of(context).pushNamed(ChatPage.routeName);
            });
          },
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: Column(
            children: [
              Container(
                width: width,
                height: height*0.4,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: width*0.5,
                      height: height*0.4,
                      child: Image.network(widget.str['photo1'],fit: BoxFit.fill,),),
                    Container(
                      width: width*0.5,
                      height: height*0.4,
                      child: Image.network(widget.str['photo2'],fit: BoxFit.fill,),),
                    Container(
                      width: width*0.5,
                      height: height*0.4,
                      child: Image.network(widget.str['photo3'],fit: BoxFit.fill,),),
                    Container(
                      width: width*0.5,
                      height: height*0.4,
                      child: Image.network(widget.str['photo4'],fit: BoxFit.fill,),),
                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              Text(widget.str['title'],style: TextStyle(
                  fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.white
              ),),
              SizedBox(height: 9.0,),
              Text(widget.str['username'],style: TextStyle(
                fontSize: 15.0,
              ),),
              SizedBox(height: 20.0,),
              Container(
                width: width*0.9,
                child: Text(widget.str['description'],style: TextStyle(),),
              ),
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap: ()async{
                  if(await canLaunch(widget.str['gitLink'])){
                    await launch(widget.str['gitLink']);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.insert_link,size: 25.0,color: Colors.white,),
                    SizedBox(width: 20.0,),
                    Text('Github link',style: TextStyle(
                      fontSize: 20.0,color: Colors.white,
                    ),)

                  ],

                ),
              ),
              SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),

    );
  }
}
