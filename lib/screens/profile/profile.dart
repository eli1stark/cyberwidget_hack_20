// helpers
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cyberwidget_hack_20/components/loader.dart';

// models
import 'package:cyberwidget_hack_20/models/user.dart';

// screens
import '../profile_settings/profile_settings.dart';
import 'package:cyberwidget_hack_20/screens/welcome/welcome.dart';

// services
import 'package:cyberwidget_hack_20/services/database/database.dart';
import 'package:cyberwidget_hack_20/services/authentication/email_auth.dart';
import 'package:cyberwidget_hack_20/services/authentication/googe_auth.dart';

enum MoreOptions { Edit, Signout }

class Profile extends StatelessWidget {
  static const routeName = '/profile';

  // Initialize EmailAuthService object
  final EmailAuthService _auth = EmailAuthService();

  // Initialize GoogleAuthService object
  final GoogleAuthService _googleAuth = GoogleAuthService();

  @override
  Widget build(BuildContext context) {
    // get User from the Stream
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // User Data from Firestore
          UserData userData = snapshot.data;
          print(userData.about);

          return Scaffold(
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 300,
                  pinned: true,
                  automaticallyImplyLeading: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Profile'),
                    background: Image.network(
                      'https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F76c7f2a8-9e75-4a48-a16e-a0bfd9f9bc73%2FUntitled.png?table=block&id=d41d1c47-e415-4bed-826c-422c78caa8ca&width=670&cache=v2',
                      fit: BoxFit.cover,
                    ),
                  ),
                  actions: <Widget>[
                    PopupMenuButton(
                      onSelected: (MoreOptions selectedValue) async {
                        if (selectedValue == MoreOptions.Signout) {
                          // DANGER ZONE. DON'T CHANGE ANYTHING
                          if (userData.about['signInMethod'] == 'email') {
                            // sign out user with email
                            await _auth.signOut();
                          } else {
                            // sign out user with Google Sign In
                            await _googleAuth.signOutGoogle();
                          }
                          // Go to the Welcome Screen
                          Navigator.pushNamed(context, Welcome.routeName);
                        } else {
                          // edit profile
                          Navigator.of(context)
                              .pushNamed(ProfileSettings.routeName);
                        }
                      },
                      itemBuilder: (_) => [
                        PopupMenuItem(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Edit'),
                              Icon(
                                Icons.edit,
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          ),
                          value: MoreOptions.Edit,
                        ),
                        PopupMenuItem(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Sign Out'),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.exit_to_app,
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          ),
                          value: MoreOptions.Signout,
                        )
                      ],
                    ),
                  ],
                ),
                SliverGrid(
                  delegate:
                      // ignore: non_constant_identifier_names
                      SliverChildBuilderDelegate(
                          (BuildContext context, int Index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 40.0, horizontal: 30.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.cyan,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              color: Color(0xFFF1009C),
                              offset: Offset(0, 2),
                            )
                          ]),
                    );
                  }, childCount: 10),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.776,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 18),
                )
              ],
            ),
          );
        } else {
          // Can cause some errors
          return Loader();
        }
      },
    );
  }
}
