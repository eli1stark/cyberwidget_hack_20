import 'package:cyberwidget_hack_20/components/bottom_navbar.dart';
import 'package:cyberwidget_hack_20/components/top_navbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: PreferredSize(
        child: TopNavBar(
          iconLeft: Icons.arrow_back,
          iconRight: FontAwesomeIcons.paperPlane,
          fontAwesomeLeft: false,
          fontAwesomeRight: true,
          onTapLeft: () {},
          onTapRight: () {},
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: CircularNotchedRectangle(),
      //   notchMargin: 4.0,
      //   child: Row(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[
      //       Icon(
      //         Icons.arrow_back,
      //         color: Colors.white,
      //         size: 35.0,
      //       ),
      //       Icon(
      //         Icons.arrow_back,
      //         color: Colors.white,
      //         size: 35.0,
      //       ),
      //       Icon(
      //         Icons.arrow_back,
      //         color: Colors.white,
      //         size: 35.0,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
