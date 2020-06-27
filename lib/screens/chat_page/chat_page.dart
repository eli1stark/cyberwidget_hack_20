import 'package:cyberwidget_hack_20/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../components/top_navbar.dart';

class ChatPage extends StatelessWidget {
  static const routeName = '/chat_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: PreferredSize(
        child: TopNavBar(
          iconLeft: Icons.arrow_back,
          iconRight: Icons.search,
          fontAwesomeLeft: false,
          fontAwesomeRight: false,
          onTapLeft: () {},
          onTapRight: () {},
          title: Text("Messages"),
          centerTitle: true,
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
    );
  }
}
