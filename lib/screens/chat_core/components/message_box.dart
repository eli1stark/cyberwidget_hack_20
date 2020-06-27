import 'package:cyberwidget_hack_20/components/constants.dart';
import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({Key key, @required this.message, @required this.isMine})
      : super(key: key);
  final String message;
  final bool isMine;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(maxWidth: width * 0.45),
          child: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: kMessageBoxColor,
          ),
          padding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}
