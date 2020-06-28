import 'package:cyberwidget_hack_20/components/bottom_navbar.dart';
import 'package:cyberwidget_hack_20/components/top_navbar.dart';
import 'package:cyberwidget_hack_20/screens/home/home.dart';
import 'package:cyberwidget_hack_20/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'package:cyberwidget_hack_20/components/tag_list.dart';
import 'package:flutter_tagging/flutter_tagging.dart';
import 'package:image_picker/image_picker.dart';

class AddProject extends StatefulWidget {
  static const routeName = '/add_project';

  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
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
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffF1009C),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle: TextStyle(color: Colors.black),
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
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffF1009C),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle: TextStyle(color: Colors.black),
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
    return FlutterTagging(
      textFieldDecoration: InputDecoration(
          border: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.black),
          hintText: "Tags",
          labelText: "Enter tags",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffF1009C),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffF1009C),
            ),
            borderRadius: BorderRadius.circular(10.0),
          )),
      addButtonWidget: _buildAddButton(),
      chipsColor: Colors.pinkAccent,
      chipsFontColor: Colors.white,
      deleteIcon: Icon(Icons.cancel, color: Colors.white),
      chipsPadding: EdgeInsets.all(2.0),
      chipsFontSize: 14.0,
      chipsSpacing: 5.0,
      chipsFontFamily: 'helvetica_neue_light',
      suggestionsCallback: (pattern) async {
        return await TagSearchService.getSuggestions(pattern);
      },
      onChanged: (result) {
        setState(() {
          _tags = result.toString();
        });
      },
    );
  }

  Widget _buildLink() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
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
        labelStyle: TextStyle(color: Colors.black),
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
            textString: "Submit",
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
                            ? Icon(FontAwesomeIcons.plusCircle, color: Colors.black)
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
                            ? Icon(FontAwesomeIcons.plusCircle, color: Colors.black,)
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
                            ? Icon(FontAwesomeIcons.plusCircle, color: Colors.black)
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
                            ? Icon(FontAwesomeIcons.plusCircle, color: Colors.black)
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

Widget _buildAddButton() {
  return Container(
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      color: Colors.pinkAccent,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.add,
          color: Colors.white,
          size: 15.0,
        ),
        Text(
          "Add New Tag",
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
      ],
    ),
  );
}
