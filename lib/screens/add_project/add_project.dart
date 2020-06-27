import 'package:cyberwidget_hack_20/components/bottom_navbar.dart';
import 'package:cyberwidget_hack_20/components/top_navbar.dart';
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
  File _image;
  String _title;
  String _discription;
  String _link;
  String _tags;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildTitle() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Title',
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
        labelText: 'Description',
      ),
      keyboardType: TextInputType.multiline,
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

  Widget _buildLink() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Tag',
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

  Widget _buildTags() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Git Repo Link',
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

  Future _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('_image: $_image');
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
            },
            onTapLeft: () {},
          ),
          preferredSize: Size.fromHeight(kToolbarHeight),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget>[
              Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildTitle(),
                      _buildDescription(),
                      _buildTags(),
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
                  onPressed: _getImage,
                  child: _image == null
                      ? Icon(FontAwesomeIcons.plusCircle)
                      : Image.file(_image),
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
                      onPressed: _getImage,
                      child: _image == null
                          ? Icon(FontAwesomeIcons.plusCircle)
                          : Image.file(_image),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: FlatButton(
                      onPressed: _getImage,
                      child: _image == null
                          ? Icon(FontAwesomeIcons.plusCircle)
                          : Image.file(_image),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: FlatButton(
                      onPressed: _getImage,
                      child: _image == null
                          ? Icon(FontAwesomeIcons.plusCircle)
                          : Image.file(_image),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: FlatButton(
                      onPressed: _getImage,
                      child: _image == null
                          ? Icon(FontAwesomeIcons.plusCircle)
                          : Image.file(_image),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
