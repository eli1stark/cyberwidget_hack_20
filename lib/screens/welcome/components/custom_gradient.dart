import 'package:flutter/material.dart';

class CustomGradient extends StatelessWidget {
  const CustomGradient({
    @required this.width,
    @required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(4, 137, 178, 0.9),
            Color.fromRGBO(26, 5, 62, 0.9),
          ],
        ),
      ),
    );
  }
}
