// Project page

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberwidget_hack_20/components/top_navbar.dart';
import 'package:cyberwidget_hack_20/screens/chat_page/chat_page.dart';
import 'package:cyberwidget_hack_20/screens/chat_page/chatview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';


class ProjectScreen extends StatefulWidget {
  var str;
  ProjectScreen(this.str);

  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
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
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                onPressed: () async {
                  pd.show();
                  FirebaseUser user=await FirebaseAuth.instance.currentUser();
                  var uid=user.uid;
                  var username;
                  await Firestore.instance.collection('users').document(uid).get().then((value) {
                    setState(() {
                      username=value.data['about']['username'];
                    });
                  }).catchError((err){
                    pd.hide();
                    Alert(
                      context: context,
                      title: 'Something wrong',
                      type: AlertType.error,

                    ).show();
                  });
                  //update friend in our end
                  await Firestore.instance.collection('Friends').document(uid).collection('Friends')
                  .document(widget.str['uid']).setData({"username":widget.str['username'],
                    "uid":widget.str['uid'],}).then((value) async {
                      //update friend in user's end
                      await Firestore.instance.collection('Friends').document
                        (widget.str['uid']).collection('Friends')
                      .document(uid).setData({'uid':uid,'username':username}).then((value){
                        pd.hide();
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context)=>Chatview(uid, widget.str['uid'],widget.str['username'])));
                      }).catchError((err){
                        pd.hide();
                        Alert(
                          context: context,
                          title: 'Something wrong',
                          type: AlertType.error,

                        ).show();
                      });
                  }).catchError((err){
                    pd.hide();
                    Alert(
                      context: context,
                      title: 'Something wrong',
                      type: AlertType.error,

                    ).show();
                  });
                },
                color: Color(0xffF1009C),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Chat here',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
