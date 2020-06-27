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
          Container(
            height: containerSize,
            width: containerSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.2),
            ),
            child: Center(
              child: imageUrl == null
                  ? Icon(
                      Icons.account_circle,
                      size: 70,
                      color: Colors.white,
                    )
                  : Image.network(
                      imageUrl,
                      fit: BoxFit.scaleDown,
                    ),
            ),
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
