// Project page

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberwidget_hack_20/components/top_navbar.dart';
import 'package:cyberwidget_hack_20/screens/chat_page/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class ProjectScreen extends StatefulWidget {
  var str;
  ProjectScreen(this.str);

  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {

  @override
  void initState() {
    print(widget.str);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                        child: Image.network(widget.str['photo1'],fit: BoxFit.fill,)),
                    Container(
                        width: width*0.5,
                        height: height*0.4,
                        child: Image.network(widget.str['photo2'],fit: BoxFit.fill,)),
                    Container(
                        width: width*0.5,
                        height: height*0.4,
                        child: Image.network(widget.str['photo3'],fit: BoxFit.fill,)),
                    Container(
                        width: width*0.5,
                        height: height*0.4,
                        child: Image.network(widget.str['photo4'],fit: BoxFit.fill,)),
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
            ],
          ),
        ),
      ),

    );
  }
}
