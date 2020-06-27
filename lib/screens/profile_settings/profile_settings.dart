import 'package:flutter/material.dart';

class ProfileSettings extends StatelessWidget {
  static const routeName = '/profile_settings';
  static const double horizontalPadding = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'Choose Your Character',
                style: TextStyle(
                    fontSize: 21,
                    color: Theme.of(context).primaryTextTheme.button.color),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: horizontalPadding),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      width: 90,
                      height: 130,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          border:
                              Border.all(color: Theme.of(context).accentColor),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 46,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'Choose Your Background',
                style: TextStyle(
                    fontSize: 21,
                    color: Theme.of(context).primaryTextTheme.button.color),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 122,
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: horizontalPadding),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: 180,
                      height: 122,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          border:
                              Border.all(color: Theme.of(context).accentColor),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: ProfileTextField(title: 'First Name'),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Last Name',
                            style: TextStyle(
                                fontSize: 21,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .button
                                    .color)),
                        const SizedBox(
                          height: 17,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(20.0)),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({String title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('First Name',
            style: TextStyle(
                fontSize: 21,
                color: Theme.of(context).primaryTextTheme.button.color)),
        const SizedBox(
          height: 17,
        ),
        TextField(
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
              borderSide: BorderSide(width: 2, color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
              borderSide:
                  BorderSide(width: 2, color: Theme.of(context).accentColor),
            ),
          ),
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
