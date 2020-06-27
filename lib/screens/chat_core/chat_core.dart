import 'package:cyberwidget_hack_20/screens/chat_core/components/message_box.dart';
import 'package:flutter/material.dart';

import '../../components/rounded_avatar.dart';
import '../../components/constants.dart';
import '../../components/top_navbar.dart';
import './components/send_message_bar.dart';

final List<String> list = List<int>.generate(50, (index) => index)
    .map(
        (e) => "mioajdfjoijeo asoiejfa efoij aefoaijef oaojaiejfoi aeoij sg $e")
    .toList();

class ChatCore extends StatelessWidget {
  static const routeName = '/chat_core';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context).settings.arguments == null
            ? {'imageUrl': null, 'name': 'Antonio'}
            : ModalRoute.of(context).settings.arguments;
    final Size size = MediaQuery.of(context)
        .removeViewInsets(removeBottom: true, removeTop: true)
        .removePadding(removeBottom: true, removeTop: true)
        .removeViewInsets(removeBottom: true, removeTop: true)
        .size;
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: PreferredSize(
        child: TopNavBar(
          iconLeft: Icons.arrow_back,
          iconRight: Icons.info,
          fontAwesomeLeft: false,
          fontAwesomeRight: false,
          onTapLeft: () {
            Navigator.pop(context);
          },
          onTapRight: () {},
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedAvatar(size: 35, imageUrl: args['imageUrl']),
              SizedBox(width: 15),
              Text(
                args['name'],
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
          centerTitle: true,
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: size.height * 0.2,
                padding: const EdgeInsets.only(top: 16),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (ctx, idx) {
                    return MessageBox(
                      message: list[idx],
                      isMine: idx % 2 == 0,
                    );
                  },
                  itemCount: list.length,
                ),
              ),
            ),
            SendMessageBarWidget(size: size)
          ],
        ),
      ),
    );
  }
}
