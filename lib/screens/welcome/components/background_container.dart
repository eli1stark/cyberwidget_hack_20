import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({
    @required this.width,
    @required this.height,
    @required this.linkToImage,
  });

  final double width;
  final double height;
  final String linkToImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Image.asset(
        linkToImage,
        fit: BoxFit.fill,
      ),
    );
  }
}
