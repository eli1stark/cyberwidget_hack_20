import 'package:flutter/material.dart';

class ArrowBack extends StatelessWidget {
  ArrowBack({@required this.onTap});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 2.0, top: 30.0),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 35.0,
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
