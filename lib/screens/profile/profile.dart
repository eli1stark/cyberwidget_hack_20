import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            automaticallyImplyLeading: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Profile'),
              background: Image.network(
                'https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F76c7f2a8-9e75-4a48-a16e-a0bfd9f9bc73%2FUntitled.png?table=block&id=d41d1c47-e415-4bed-826c-422c78caa8ca&width=670&cache=v2',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverGrid(
            delegate:
                // ignore: non_constant_identifier_names
                SliverChildBuilderDelegate((BuildContext context, int Index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.cyan,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        color: Color(0xFFF1009C),
                        offset: Offset(0, 2),
                      )
                    ]),
              );
            }, childCount: 10),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.776,
                crossAxisSpacing: 24,
                mainAxisSpacing: 18),
          )
        ],
      ),
    );
  }
}
