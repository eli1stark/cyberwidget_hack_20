// helpers
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// screens
import 'package:cyberwidget_hack_20/screens/container/tabs_screen.dart';

// services
import 'package:cyberwidget_hack_20/services/authentication/email_auth.dart';

// components
import 'components/arrow_back.dart';
import 'components/custom_gradient.dart';
import 'components/background_container.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/sign_up';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email, fstname, lstname, password, username;
  bool ispswd = true;
  ProgressDialog pd;
  @override
  void initState() {
    super.initState();
    email = TextEditingController(text: '');
    fstname = TextEditingController(text: '');
    lstname = TextEditingController(text: '');
    password = TextEditingController(text: '');
    username = TextEditingController(text: '');
  }

  // Initialize Auth object
  final EmailAuthService _auth = EmailAuthService();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    pd = ProgressDialog(context);
    pd.style(message: 'Please wait...');
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: Stack(
            children: [
              BackgroundContainer(
                width: width,
                height: height,
                linkToImage: 'assets/signin.png',
              ),
              BackgroundContainer(
                width: width,
                height: height,
                linkToImage: 'assets/design.png',
              ),
              CustomGradient(
                width: width,
                height: height,
              ),
              ArrowBack(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: width * 0.8,
                  height: height,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * 0.15,
                        ),
                        TextField(
                          controller: email,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.white),
                            suffixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            //border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextField(
                          controller: username,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: 'Username',
                              hintStyle: TextStyle(color: Colors.white),
                              suffixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              )),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width * 0.39,
                              child: TextField(
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                controller: fstname,
                                decoration: InputDecoration(
                                  hintText: 'First Name',
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              width: width * 0.39,
                              child: TextField(
                                controller: lstname,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Last Name',
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextField(
                          controller: password,
                          cursorColor: Colors.white,
                          obscureText: ispswd,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.white),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.vpn_key,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  ispswd = !ispswd;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.1,
                        ),
                        Container(
                          width: width * 0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff6F29E6),
                                  spreadRadius: 2.0,
                                  blurRadius: 4.0,
                                  offset: Offset(0, 4),
                                )
                              ]),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            onPressed: () async {
                              if (username.text.isEmpty ||
                                  fstname.text.isEmpty ||
                                  lstname.text.isEmpty ||
                                  email.text.isEmpty ||
                                  password.text.isEmpty) {
                                Alert(
                                    context: context,
                                    type: AlertType.warning,
                                    title: 'Fill all the fields',
                                    buttons: [
                                      DialogButton(
                                        child: Text('Okay'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        color: Color(0xffF1009C),
                                      )
                                    ]).show();
                              } else {
                                pd.show();
                                // Trying to register the user
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email.text, password.text);
                                // If success:
                                if (result != null) {
                                  pd.hide();
                                  // TODO add username, firstname and lastname to firestore
                                  //     username.text,
                                  //     fstname.text,
                                  //     lstname.text,
                                  Navigator.pushNamed(
                                    context,
                                    TabsScreen.routeName,
                                  );
                                } else {
                                  pd.hide();
                                  Alert(
                                    context: context,
                                    type: AlertType.error,
                                    title: 'Something wrong',
                                    buttons: [
                                      DialogButton(
                                        child: Text('Okay'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        color: Color(0xffF1009C),
                                      )
                                    ],
                                  ).show();
                                }
                                email.clear();
                                username.clear();
                                fstname.clear();
                                lstname.clear();
                                password.clear();
                              }
                            },
                            color: Color(0xffF1009C),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'Create Account',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
