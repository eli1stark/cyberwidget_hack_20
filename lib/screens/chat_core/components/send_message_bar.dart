import 'package:flutter/material.dart';
import '../../../components/constants.dart';

class SendMessageBarWidget extends StatelessWidget {
  const SendMessageBarWidget({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      width: size.width,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Write your Meessage here",
                labelStyle: TextStyle(color: kInputFieldColor),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          IconButton(
              icon: Icon(
                Icons.send,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
