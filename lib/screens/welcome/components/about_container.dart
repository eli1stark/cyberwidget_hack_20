import 'package:flutter/material.dart';

class AboutContainer extends StatelessWidget {
  const AboutContainer({
    @required this.width,
    @required this.linkToLogo,
    @required this.text,
  });

  final double width;
  final String linkToLogo;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width * 0.6,
            child: Image.asset(
              linkToLogo,
              fit: BoxFit.fill,
            ), //here I'm adding the cyberwidget logo
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: width * 0.65,
            height: 50.0,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15.0,
                color: Color(0xffC4C4C4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
