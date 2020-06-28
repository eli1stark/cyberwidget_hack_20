import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberwidget_hack_20/components/tag_list.dart';
import 'package:cyberwidget_hack_20/components/top_navbar.dart';
import 'package:cyberwidget_hack_20/screens/chat_page/chat_page.dart';
import 'package:cyberwidget_hack_20/screens/home/components/postlist.dart';
import 'package:cyberwidget_hack_20/screens/home/components/tagslist.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Showingtagpost extends StatefulWidget {

  String selectedtag;
  Showingtagpost(this.selectedtag);
  @override
  _ShowingtagpostState createState() => _ShowingtagpostState();
}

class _ShowingtagpostState extends State<Showingtagpost> {

  List tags=Tags().get_the_listoftags();



  List<Widget> getforpost(){
    List<Widget> ls=[];
    setState(() {
      tags.forEach((element) {
        ls.add(
          Taglist(element),
        );
      });
    });
    return ls;

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
              SizedBox(height: 15.0,),
              Container(
                width: width,
                height: 30.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: getforpost(),
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                width: width,
                height: height*0.9,
                child: StreamBuilder(
                  stream: Firestore.instance.collection('posts').
                  where('tag1',isEqualTo:widget.selectedtag).getDocuments().asStream(),
                  builder: (context,snapshot){
                    print('hello');
                    if(!snapshot.hasData || snapshot==null){
                      return Center(child: Text('No post yet'));
                    }
                    return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context,index){
                          return Postlist(snapshot.data.documents[index],index);
                        });
                  },
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
