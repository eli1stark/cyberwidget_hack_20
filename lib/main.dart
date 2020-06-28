import 'package:flutter/material.dart';

// models
import 'models/user.dart';

// screens
import 'package:cyberwidget_hack_20/wrapper.dart';
import 'screens/add_project/add_project.dart';
import 'screens/chat_core/chat_core.dart';
import 'screens/chat_page/chat_page.dart';
import 'screens/home/home.dart';
import 'screens/profile/profile.dart';
import 'screens/profile_settings/profile_settings.dart';
import 'screens/welcome/sigin.dart';
import 'screens/welcome/signup.dart';
import 'screens/welcome/welcome.dart';
import 'screens/container/tabs_screen.dart';

// provider
import 'package:provider/provider.dart';

// services
import 'services/authentication/email_auth.dart';

void main() {
  runApp(MyApp());
}

Map<int, Color> colorMap = {
      50: Color.fromRGBO(255, 255, 255, .1),
      100: Color.fromRGBO(255, 255, 255, .2),
      200: Color.fromRGBO(255, 255, 255, .3),
      300: Color.fromRGBO(255, 255, 255, .4),
      400: Color.fromRGBO(255, 255, 255, .5),
      500: Color.fromRGBO(255, 255, 255, .6),
      600: Color.fromRGBO(255, 255, 255, .7),
      700: Color.fromRGBO(255, 255, 255, .8),
      800: Color.fromRGBO(255, 255, 255, .9),
      900: Color.fromRGBO(255, 255, 255, 1),
   };

class MyApp extends StatelessWidget {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    // user data goes down the Stream
    return StreamProvider<User>.value(
      value: EmailAuthService().user,
      child: MaterialApp(
        
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: MaterialColor(0xFFffffff, colorMap),
          primaryColor: Color(0xff1A053E),
          canvasColor: Color(0xff1A053E),
          //fontFamily: 'Lato',
          accentColor: Color(0xFFF1009C),
        ),
        routes: {
          // DANGER ZONE, Don't change initial route!:
          '/': (context) => Wrapper(),
          // routes:
          TabsScreen.routeName: (context) => TabsScreen(),
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
      ),
    );
  }
}
