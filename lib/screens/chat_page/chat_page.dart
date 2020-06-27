import 'package:cyberwidget_hack_20/components/constants.dart';
import 'package:cyberwidget_hack_20/screens/chat_page/components/chat_list_tile.dart';
import 'package:cyberwidget_hack_20/screens/container/tabs_screen.dart';
import 'package:flutter/material.dart';
import '../../components/top_navbar.dart';

const people = [
  {'name': 'Eli', 'subtext': 'lorem ipsum'},
  {'name': 'Balaji', 'subtext': 'lorem ipsum'},
  {'name': 'Akshay', 'subtext': 'lorem ipsum'},
  {'name': 'Antonio', 'subtext': 'lorem ipsum'},
  {
    'name': 'Hashem',
    'subtext': 'lorem ipsum very long but like very very very long',
    'imageUrl':
        'https://cdn4.iconfinder.com/data/icons/avatars-circle-2/72/146-512.png'
  }
];

class ChatPage extends StatelessWidget {
  static const routeName = '/chat_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: PreferredSize(
        child: TopNavBar(
          iconLeft: Icons.arrow_back,
          iconRight: Icons.search,
          fontAwesomeLeft: false,
          fontAwesomeRight: false,
          onTapLeft: () {
            Navigator.pop(context);
          },
          onTapRight: () {},
          title: Text("Messages"),
          centerTitle: true,
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 37),
        itemBuilder: (ctx, idx) {
          return ChatListTile(
            name: people[idx]['name'],
            status: people[idx]['subtext'],
            imageUrl: people[idx].containsKey('imageUrl')
                ? people[idx]['imageUrl']
                : null,
          );
        },
        itemCount: people.length,
      ),
    );
  }
}
