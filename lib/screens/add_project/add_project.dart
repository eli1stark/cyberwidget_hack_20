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
  String name;

  Future _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('_image: $_image');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: TopNavBar(
          iconLeft: Icons.arrow_back,
          fontAwesomeLeft: false,
          fontAwesomeRight: false,
          textButtonVisibility: true,
          textString: "Final",
          onTapText: () {},
          onTapLeft: () {},
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.vertical,
        children: <Widget>[
          Text('$name'),
          TextFormField(onChanged: (text) {
            
          }),
          SizedBox(height: 50,),
          Container(
                height: 150,
                width: 300,
                decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(12)),
                child: FlatButton(
                  onPressed: _getImage,
                  child: _image == null
                      ? Icon(FontAwesomeIcons.plusCircle)
                      : Image.file(_image),
                ),
              ),
          Wrap(
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(12)),
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
                decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(12)),
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
                decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(12)),
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
                decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(12)),
                child: FlatButton(
                  onPressed: _getImage,
                  child: _image == null
                      ? Icon(FontAwesomeIcons.plusCircle)
                      : Image.file(_image),
                ),
              ),
            ],
          ),

          // TextField(
          //   cursorColor: Colors.white,
          //   style: TextStyle(color: Colors.white),
          //   decoration: InputDecoration(
          //     hintText: 'Title',
          //     hintStyle: TextStyle(color: Colors.white),
          //     //border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
          //   ),
          // ),
          // SizedBox(
          //   height: 25,
          // ),
          // Text(
          //   "Description",
          //   style: TextStyle(color: Colors.white, fontSize: 24),
          // ),
          // SizedBox(
          //   height: 25,
          // ),
          // TextField(
          //   cursorColor: Colors.white,
          //   style: TextStyle(color: Colors.white),
          //   decoration: InputDecoration(
          //     hintText: 'Write Your Description Here!',
          //     hintStyle: TextStyle(color: Colors.white),
          //     //border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
          //   ),
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Text(
          //       "Tags",
          //       style: TextStyle(color: Colors.white, fontSize: 24),
          //     ),
          //     TextField(
          //       cursorColor: Colors.white,
          //       style: TextStyle(color: Colors.white),
          //       decoration: InputDecoration(
          //         hintText: '',
          //         hintStyle: TextStyle(color: Colors.white),
          //         //border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
          //       ),
          //     ),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Text(
          //       "Repo Link",
          //       style: TextStyle(color: Colors.white, fontSize: 24),
          //     ),
          //     TextField(
          //       cursorColor: Colors.white,
          //       style: TextStyle(color: Colors.white),
          //       decoration: InputDecoration(
          //         hintText: 'www.github.com',
          //         hintStyle: TextStyle(color: Colors.white),
          //         //border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
          //       ),
          //     ),
          //   ],
          // ),
          // Stack(
          //   children: <Widget>[
          //     Container(
          //       height: 130,
          //       width: 354,
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(44),
          //       ),
          //       // color: Colors.white,
          //       // child: Image(image: null),
          //     ),
          //     FlatButton(
          //       child: Container(
          //           height: 60,
          //           width: 200,
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(18),
          //           ),
          //           // color: Color(0xff434343),
          //           child: Center(
          //             child: Text(
          //               "Repo Link",
          //               style: TextStyle(color: Colors.white, fontSize: 24),
          //             ),
          //           )),
          //       onPressed: () {},
          //     ),
          //   ],
          // ),
          // Row(
          //    children: <Widget>[
          //      Container(
          //       height: 80,
          //       width: 80,
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(12),
          //       ),
          //       // color: Colors.white,
          //       // child: Image(image: null),
          //     ),
          //     Container(
          //       height: 80,
          //       width: 80,
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(44),
          //       ),
          //       // color: Colors.white,
          //       child: Icon(Icons.add_a_photo),
          //     ),
          //    ],
          // )
        ],
      ),
    );
  }
}
