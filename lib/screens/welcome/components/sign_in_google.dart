import 'package:flutter/material.dart';

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({
    @required this.width,
    @required this.onTap,
  });

  final double width;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Color(0xff6F29E6),
            spreadRadius: 2.0,
            blurRadius: 4.0,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        onPressed: onTap,
        color: Colors.white,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 30.0,
                  height: 30.0,
                  child: Image.asset(
                    'assets/google.png',
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                width: 15.0,
              ),
              Text(
                'Sign-in with Google',
                style: TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
