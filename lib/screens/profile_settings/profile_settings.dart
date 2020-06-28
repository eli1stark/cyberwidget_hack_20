import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ProfileSettings extends StatefulWidget {
  static const routeName = '/profile_settings';
  static const double horizontalPadding = 30;

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  Map<String, Object> _profileData = {};

  final GlobalKey<FormState> _formKey = GlobalKey();
  final characterImages = [
    'assets/char_assets/c1.png',
    'assets/char_assets/c2.png',
    'assets/char_assets/c3.png',
    'assets/char_assets/c4.png',
    'assets/char_assets/c5.png',
    'assets/char_assets/c6.png',
    'assets/char_assets/c7.png',
    'assets/char_assets/c8.png'
  ];
  final backgroundImages = [
    'assets/bg_assets/bg1.png',
    'assets/bg_assets/bg2.png',
    'assets/bg_assets/bg3.png',
    'assets/bg_assets/bg4.png',
    'assets/bg_assets/bg5.png',
    'assets/bg_assets/bg6.png'
  ];
  ProgressDialog loadingWidget;

  int _selectedCharacterIndex;
  int _selectedBackgroundIndex;

  void _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      print('invalid form');
      return;
    }
    _formKey.currentState.save();
    loadingWidget.show();
    print('valid form');
  }

  @override
  Widget build(BuildContext context) {
    loadingWidget = ProgressDialog(context, isDismissible: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _submit,
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: ProfileSettings.horizontalPadding),
                child: Text(
                  'Choose Your Character',
                  style: TextStyle(
                      fontSize: 21,
                      color: Theme.of(context).primaryTextTheme.button.color),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: ProfileSettings.horizontalPadding),
                  scrollDirection: Axis.horizontal,
                  itemCount: characterImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _profileData['characterIndex'] = index;
                        setState(() {
                          _selectedCharacterIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          width: 90,
                          height: 130,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(characterImages[index]),
                                  fit: BoxFit.fitHeight),
                              gradient: RadialGradient(colors: [
                                Theme.of(context).accentColor,
                                Color(0XFF6F29E6)
                              ]),
                              border: Border.all(
                                  width: 2,
                                  color: index == _selectedCharacterIndex
                                      ? Theme.of(context).accentColor
                                      : Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: ProfileSettings.horizontalPadding),
                child: Text(
                  'Choose Your Background',
                  style: TextStyle(
                      fontSize: 21,
                      color: Theme.of(context).primaryTextTheme.button.color),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 122,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: ProfileSettings.horizontalPadding),
                  scrollDirection: Axis.horizontal,
                  itemCount: backgroundImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _profileData['backgroundIndex'] = index;
                        setState(() {
                          _selectedBackgroundIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          width: 180,
                          height: 122,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(backgroundImages[index]),
                                  fit: BoxFit.fitHeight),
                              color: Colors.amber,
                              border: Border.all(
                                  width: 2,
                                  color: index == _selectedBackgroundIndex
                                      ? Theme.of(context).accentColor
                                      : Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: ProfileSettings.horizontalPadding),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: ProfileTextField(
                            title: 'First Name',
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return 'Field must not be empty';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _profileData['firstName'] = value;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Flexible(
                          flex: 1,
                          child: ProfileTextField(
                              title: 'Last Name',
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return 'Field must not be empty';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _profileData['lastName'] = value;
                              }),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ProfileTextField(
                      title: 'User Name',
                      onSaved: (value) {
                        _profileData['username'] = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ProfileTextField(
                      title: 'Github',
                      onSaved: (value) {
                        _profileData['github'] = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ProfileTextField(
                      title: 'LinkedIn',
                      onSaved: (value) {
                        _profileData['linkedin'] = value;
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final Function(String value) onSaved;
  final String Function(String value) validator;
  final String title;
  ProfileTextField(
      {@required this.title, @required this.onSaved, this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,
            style: TextStyle(
                fontSize: 21,
                color: Theme.of(context).primaryTextTheme.button.color)),
        const SizedBox(
          height: 17,
        ),
        TextFormField(
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(20.0)),
                borderSide: BorderSide(width: 2, color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(20.0)),
                borderSide:
                    BorderSide(width: 2, color: Theme.of(context).accentColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(20.0)),
                borderSide:
                    BorderSide(width: 2, color: Theme.of(context).accentColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(20.0)),
                borderSide:
                    BorderSide(width: 2, color: Theme.of(context).accentColor),
              )),
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          validator: (value) {
            if (validator != null) {
              return validator(value);
            } else {
              return null;
            }
          },
          onSaved: (String value) {
            onSaved(value);
          },
        ),
      ],
    );
  }
}
