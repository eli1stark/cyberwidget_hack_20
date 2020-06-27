import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              child: Image.asset(
                'assets/homeback.png',
                fit: BoxFit.fill,
              ),
            ),
//            Container(
//              width: width,
//              height: height,
//              child: Image.asset('assets/homefront.png',fit: BoxFit.fill,),
//            ),
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromRGBO(241, 0, 156, 0.38),
                    Color(0xff1A053E)
                  ])),
            ),
            Container(
              width: width,
              height: height,
              child: Image.asset(
                'assets/design.png',
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.6,
                    child: Image.asset(
                      'assets/cyberwidgetlogo.png',
                      fit: BoxFit.fill,
                    ), //here I'm adding the cyberwidget logo
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: width * 0.65,
                    height: 50.0,
                    child: Expanded(
                      //here is the expandable text
                      child: Text(
                        'Discover the top Flutter Designers & Developers',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xffC4C4C4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: width * 0.7,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () {},
                        color: Colors.white,
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 30.0,
                                  height: 30.0,
                                  child: Image.asset(
                                    'assets/google.png',
                                    fit: BoxFit.fill,
                                  )),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text('Sign-in with Google')
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text('Or with Email',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xffC4C4C4),
                        )),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            color: Color(0xffF1009C),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xffC4C4C4),
                                ),
                              ),
                            ),
                          ),
                          RaisedButton(
                            color: Color(0xffF1009C),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xffC4C4C4),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
