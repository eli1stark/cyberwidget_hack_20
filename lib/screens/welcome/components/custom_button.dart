import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    @required this.text,
    @required this.onTap,
  });

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12.0), boxShadow: [
        BoxShadow(
          color: Color(0xff6F29E6),
          spreadRadius: 1.0,
          blurRadius: 8.0,
          offset: Offset(4, 4),
        )
      ]),
      child: RaisedButton(
        color: Color(0xffF1009C),
        onPressed: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xffC4C4C4),
            ),
          ),
        ),
      ),
    );
  }
}
