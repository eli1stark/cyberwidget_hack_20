import 'package:flutter/material.dart';

// screens
import 'sigin.dart';
import 'signup.dart';

// components
import 'components/background_container.dart';
import 'components/gradient_container.dart';
import 'components/about_container.dart';
import 'components/buttons_container.dart';

// services
import 'package:cyberwidget_hack_20/services/authentication/googe_auth.dart';

class Welcome extends StatefulWidget {
  static const routeName = 'welcome_screen';
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool animationFinished = false;

  // Initialize Auth object
  final GoogleAuthService _auth = GoogleAuthService();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            BackgroundContainer(
              width: width,
              height: height,
              linkToImage: 'assets/homeback.png',
            ),
            AnimatedOpacity(
              child: BackgroundContainer(
                width: width,
                height: height,
                linkToImage: 'assets/design.png',
              ),
              opacity: animationFinished ? 0 : 1,
              duration: const Duration(seconds: 2),
              onEnd: () => setState(() {
                animationFinished = !animationFinished;
              }),
            ),
            GradientContainer(
              width: width,
              height: height,
            ),
            AboutContainer(
              width: width,
              linkToLogo: 'assets/cyberwidgetlogo.png',
              text: 'Discover the top Flutter Designers & Developers',
            ),
            ButtonsContainer(
              width: width,
              onSignWithGoogle: () async {
                // Trying to register the user
                dynamic result = await _auth.signInGoogle();
                if (result != null) {
                  // TODO: If I signed out from google account and trying
                  // to Sign In again I can't go to the Home screen, I need close the
                  // App and open it again to solve. I don't know why.
                } else {
                  print('error');
                }
              },
              onSignIn: () {
                Navigator.pushNamed(
                  context,
                  SignIn.routeName,
                );
              },
              onSignUp: () {
                Navigator.pushNamed(
                  context,
                  SignUp.routeName,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
