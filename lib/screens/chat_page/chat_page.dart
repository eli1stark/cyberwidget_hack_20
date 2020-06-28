import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberwidget_hack_20/components/constants.dart';
import 'package:cyberwidget_hack_20/screens/chat_page/chatview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../components/top_navbar.dart';


class ChatPage extends StatefulWidget {
  static const routeName = '/chat_page';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Widget> ls=[];
  List userimage=['assets/char_assets/c1.png','assets/char_assets/c2.png','assets/char_assets/c3.png',
    'assets/char_assets/c4.png','assets/char_assets/c5.png','assets/char_assets/c6.png','assets/char_assets/c7.png',
    'assets/char_assets/c8.png'];
  var ran = Random();
  var l;
  getcurrentuserdetails() async{
    FirebaseUser user=await FirebaseAuth.instance.currentUser();
    var uid=user.uid;
    await Firestore.instance.collection('Friends').document(uid).collection('Friends').getDocuments()
    .then((value) {
      value.documents.forEach((element) {
        setState(() {
          l= ran.nextInt(userimage.length);
          ls.add(
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:
                    (context)=>Chatview(uid, element.data['uid'],element.data['username'])));
              },
              child: Material(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 70.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Image.asset(userimage[l],fit: BoxFit.fill,),
                          ),
                          SizedBox(width: 20.0,),
                          Text(element.data['username'],style: TextStyle(
                            fontSize: 20.0,
                          ),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
      });
    }).catchError((err){
      print('error $err');
      setState(() {
        ls.add(
            Center(child: Text('NO USER'),),
        );
      });
    });
  }
  @override
  void initState() {
    getcurrentuserdetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: PreferredSize(
        child: TopNavBar(
          iconLeft: Icons.arrow_back,
          iconRight: Icons.search,
          fontAwesomeLeft: false,
          fontAwesomeRight: false,
          onTapLeft: () {
            Navigator.pop(context);
          },
          onTapRight: () {},
          title: Text("Messages"),
          centerTitle: true,
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: Column(
            children: ls,
          ),
        ),
      ),
    );
  }
}
