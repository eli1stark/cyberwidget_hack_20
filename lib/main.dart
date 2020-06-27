import 'package:flutter/material.dart';

import 'screens/add_project/add_project.dart';
import 'screens/chat_core/chat_core.dart';
import 'screens/chat_page/chat_page.dart';
import 'screens/container/tabs_screen.dart';
import 'screens/home/home.dart';
import 'screens/profile/profile.dart';
import 'screens/profile_settings/profile_settings.dart';
import 'screens/welcome/sigin.dart';
import 'screens/welcome/signup.dart';
import 'screens/welcome/welcome.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff1A053E),
        canvasColor: Color(0xff1A053E),
        //fontFamily: 'Lato',
        accentColor: Colors.grey,
      ),
      routes: {
        // initial route:
        '/': (context) => TabsScreen(),
        // routes:
        ChatCore.routeName: (context) => ChatCore(),
        ChatPage.routeName: (context) => ChatPage(),
        Home.routeName: (context) => Home(),
        Profile.routeName: (context) => Profile(),
        ProfileSettings.routeName: (context) => ProfileSettings(),
        Welcome.routeName: (context) => Welcome(),
        AddProject.routeName: (context) => AddProject(),
        SignIn.routeName: (context) => SignIn(),
        SignUp.routeName: (context) => SignUp(),
      },
    );
  }
}
