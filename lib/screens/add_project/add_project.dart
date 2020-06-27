import 'package:cyberwidget_hack_20/components/bottom_navbar.dart';
import 'package:cyberwidget_hack_20/components/top_navbar.dart';
import 'package:flutter/material.dart';

class AddProject extends StatelessWidget {
  static const routeName = '/add_project';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: TopNavBar(
          iconLeft: Icons.arrow_back,
          fontAwesomeLeft: false,
          fontAwesomeRight: false,
          textButtonVisibility: true,
          textString: "Final",
          onTapText: () {},
          onTapLeft: () {},
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
    );
  }
}
