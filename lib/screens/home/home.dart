import 'package:cyberwidget_hack_20/components/bottom_navbar.dart';
import 'package:cyberwidget_hack_20/components/tag_list.dart';
import 'package:cyberwidget_hack_20/components/top_navbar.dart';
import 'package:cyberwidget_hack_20/screens/chat_page/chat_page.dart';
import 'package:cyberwidget_hack_20/screens/home/components/tagslist.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List tags = Tags().get_the_listoftags();
  List<Widget> ls = [];
  getvalues() {
    setState(() {
      tags.forEach((element) {
        print('debug $element');
        ls.add(
          Taglist(element),
        );
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getvalues();
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
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            SizedBox(
              height: 15.0,
            ),
            Container(
              width: width,
              height: 30.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: ls,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
