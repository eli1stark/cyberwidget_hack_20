import 'package:flutter/material.dart';
// components
import 'custom_button.dart';
import 'sign_in_google.dart';

class ButtonsContainer extends StatelessWidget {
  const ButtonsContainer({
    @required this.width,
    @required this.onSignWithGoogle,
    @required this.onSignIn,
    @required this.onSignUp,
  });

  final double width;
  final Function onSignWithGoogle;
  final Function onSignIn;
  final Function onSignUp;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SignInWithGoogle(
              width: width,
              onTap: onSignWithGoogle,
            ),
            SizedBox(
              height: 15.0,
            ),
            Text('Or with Email',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xffC4C4C4),
                )),
            SizedBox(
              height: 15.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    text: 'Sign In',
                    onTap: onSignIn,
                  ),
                  CustomButton(
                    text: 'Sign Up',
                    onTap: onSignUp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
