import 'package:flutter/material.dart';
// screens
import 'sigin.dart';
import 'signup.dart';
// components
import 'components/background_container.dart';
import 'components/gradient_container.dart';
import 'components/about_container.dart';
import 'components/buttons_container.dart';

class Welcome extends StatefulWidget {
  static const routeName = 'welcome_screen';
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool animationFinished = false;

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
              onSignWithGoogle: () {},
              onSignIn: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Signin(),
                  ),
                );
              },
              onSignUp: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Signup(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
