import 'package:cyberwidget_hack_20/components/bottom_navbar.dart';
import 'package:cyberwidget_hack_20/components/top_navbar.dart';
import 'package:flutter/material.dart';

class AddProject extends StatelessWidget {
  static const routeName = '/add_project';
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
<<<<<<< HEAD
      ),
      body: Wrap(
        direction: Axis.vertical,
        children: <Widget>[
          TextField(
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Title',
              hintStyle: TextStyle(color: Colors.white),
              //border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Description",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Write Your Description Here!',
              hintStyle: TextStyle(color: Colors.white),
              //border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Tags",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              TextField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: '',
                  hintStyle: TextStyle(color: Colors.white),
                  //border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Repo Link",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              TextField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'www.github.com',
                  hintStyle: TextStyle(color: Colors.white),
                  //border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              Container(
                height: 130,
                width: 354,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(44),
                ),
                color: Colors.white,
                child: Image(image: null),
              ),
              FlatButton(
                child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    color: Color(0xff434343),
                    child: Center(
                      child: Text(
                        "Repo Link",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    )),
                onPressed: () {},
              ),
            ],
          ),
          Row(
             children: <Widget>[
               Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.white,
                child: Image(image: null),
              ),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(44),
                ),
                color: Colors.white,
                child: Icon(Icons.add_a_photo),
              ),
             ],
          )
        ],
=======
>>>>>>> 2171eb492cb25b0a11a44e4560e2b92a47585f42
      ),
    );
  }
}
