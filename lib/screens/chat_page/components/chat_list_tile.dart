import 'package:cyberwidget_hack_20/components/rounded_avatar.dart';
import 'package:flutter/material.dart';
import '../../../components/constants.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile(
      {Key key,
      @required this.name,
      this.surname,
      @required this.status,
      this.imageUrl})
      : super(key: key);

  final String name;
  final String surname;
  final String status;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final stringName = this.name + (this.surname == null ? "" : " $surname");
    final containerSize = 80.0;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RoundedAvatar(
            size: containerSize,
            imageUrl: imageUrl,
          ),
          SizedBox(
            width: 17,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stringName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                Text(
                  status,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: kSubtitleChatListTileColor, fontSize: 15),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
