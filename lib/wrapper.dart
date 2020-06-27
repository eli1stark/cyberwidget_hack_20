// Eli Stark
// DANGER ZONE
// Don't edit this file on your own
// Contact Eli please

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'screens/welcome/welcome.dart';
import 'screens/container/tabs_screen.dart';

// checking whether the user LogOut or LogIn
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // get User from the Stream
    final user = Provider.of<User>(context);

    // return Welcome() or Home() depending on
    // whether the user logged in or not
    if (user == null) {
      return Welcome();
    } else {
      return TabsScreen();
    }
  }
}
