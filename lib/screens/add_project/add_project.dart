import 'package:cyberwidget_hack_20/components/bottom_navbar.dart';
import 'package:cyberwidget_hack_20/components/top_navbar.dart';
import 'package:cyberwidget_hack_20/screens/home/home.dart';
import 'package:cyberwidget_hack_20/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class AddProject extends StatefulWidget {
  static const routeName = '/add_project';

  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  File _image1;
  File _image2;
  File _image3;
  File _image4;
  File _image5;
  String _title;
  String _discription;
  String _link;
  String _tags;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildTitle() {
    return TextFormField(
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffF1009C),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        labelText: 'Title',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffF1009C),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Title is Required';
        }
      },
      onSaved: (String value) {
        _title = value;
      },
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffF1009C),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        labelText: 'Description',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffF1009C),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Description is Required';
        }
      },
      onSaved: (String value) {
        _discription = value;
      },
    );
  }

  Widget _buildTags() {
    return TextFormField(
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffF1009C),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        labelText: 'Tags',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffF1009C),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Tag is Required';
        }
      },
      onSaved: (String value) {
        _tags = value;
      },
    );
  }

  Widget _buildLink() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffF1009C),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        labelText: 'Git Repo Link',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffF1009C),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Link is Required';
        }
      },
      onSaved: (String value) {
        _link = value;
      },
    );
  }

  Future _getImage1() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image1 = image;
    });
  }

  Future _getImage2() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image2 = image;
    });
  }

  Future _getImage3() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image2 = image;
    });
  }

  Future _getImage4() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image4 = image;
    });
  }

  Future _getImage5() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image5 = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: TopNavBar(
            iconLeft: Icons.arrow_back,
            fontAwesomeLeft: false,
            fontAwesomeRight: false,
            textButtonVisibility: true,
            textString: "Final",
            onTapText: () {
              if (!_formkey.currentState.validate()) {
                return;
              }
              _formkey.currentState.save();
              print(_title);
              Navigator.pushNamed(context, Home.routeName);
            },
            onTapLeft: () {
              Navigator.pushNamed(context, Home.routeName);
            },
          ),
          preferredSize: Size.fromHeight(kToolbarHeight),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: <Widget>[
                Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        _buildTitle(),
                        SizedBox(
                          height: 12,
                        ),
                        _buildDescription(),
                        SizedBox(
                          height: 12,
                        ),
                        _buildTags(),
                        SizedBox(
                          height: 12,
                        ),
                        _buildLink(),
                      ],
                    )),
                SizedBox(
                  height: 24,
                ),
                Container(
                  height: 150,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: FlatButton(
                    onPressed: _getImage1,
                    child: _image1 == null
                        ? Icon(FontAwesomeIcons.plusCircle)
                        : Image.file(_image1),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: FlatButton(
                        onPressed: _getImage2,
                        child: _image2 == null
                            ? Icon(FontAwesomeIcons.plusCircle)
                            : Image.file(_image2),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: FlatButton(
                        onPressed: _getImage3,
                        child: _image3 == null
                            ? Icon(FontAwesomeIcons.plusCircle)
                            : Image.file(_image3),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: FlatButton(
                        onPressed: _getImage4,
                        child: _image4 == null
                            ? Icon(FontAwesomeIcons.plusCircle)
                            : Image.file(_image4),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: FlatButton(
                        onPressed: _getImage5,
                        child: _image5 == null
                            ? Icon(FontAwesomeIcons.plusCircle)
                            : Image.file(_image5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
