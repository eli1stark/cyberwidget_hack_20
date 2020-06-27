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
  final Function(int index) _onSelectItem;
  BottomNavBar(this._onSelectItem);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.purple,
        selectedItemColor: Colors.purple[900],
        backgroundColor: Colors.white,
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
          _currentIndex = index;
          widget._onSelectItem(index);
        },
      ),
    );
  }
}
