import 'package:flutter/material.dart';
import 'package:cyberwidget_hack_20/screens/home/home.dart';
import 'package:cyberwidget_hack_20/screens/profile/profile.dart';
import 'package:cyberwidget_hack_20/screens/add_project/add_project.dart';

/// Index must be specified:
/// index "0" is Home().
/// index "1" is AddProject().
/// index "2" is Profile().
/// Example:
/// bottomNavigationBar: BottomNavBar(
///   newIndex: 0,
/// ),
class BottomNavBar extends StatefulWidget {
  BottomNavBar({this.newIndex});

  final int newIndex;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.newIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.purple,
        selectedItemColor: Colors.purple[900],
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              //Icons.filter,
              size: 35.0,
            ),
            // Padding to remove neccessary title
            title: Padding(padding: EdgeInsets.all(0)),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
              size: 35.0,
            ),
            // Padding to remove neccessary title
            title: Padding(padding: EdgeInsets.all(0)),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 35.0,
            ),
            // Padding to remove neccessary title
            title: Padding(padding: EdgeInsets.all(0)),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.pushNamed(context, Home.routeName);
          } else if (index == 1) {
            Navigator.pushNamed(context, AddProject.routeName);
          } else if (index == 2) {
            Navigator.pushNamed(context, Profile.routeName);
          }
        },
      ),
    );
  }
}
