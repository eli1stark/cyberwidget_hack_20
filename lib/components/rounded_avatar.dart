import 'package:flutter/material.dart';

class RoundedAvatar extends StatelessWidget {
  const RoundedAvatar({Key key, @required this.size, this.imageUrl})
      : super(key: key);

  final double size;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.2),
      ),
      child: Center(
        child: imageUrl == null
            ? Icon(
                Icons.account_circle,
                size: size * 0.9,
                color: Colors.white,
              )
            : Image.network(
                imageUrl,
                fit: BoxFit.scaleDown,
              ),
      ),
    );
  }
}
