import 'package:flutter/material.dart';
// screens
import 'sigin.dart';
import 'signup.dart';
// components
import 'components/background_container.dart';
import 'components/gradient_container.dart';
import 'components/about_container.dart';
import 'components/buttons_container.dart';

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
            BackgroundContainer(
              width: width,
              height: height,
              linkToImage: 'assets/homeback.png',
            ),
            BackgroundContainer(
              width: width,
              height: height,
              linkToImage: 'assets/design.png',
            ),
            GradientContainer(
              width: width,
              height: height,
            ),
            AboutContainer(
              width: width,
              linkToLogo: 'assets/cyberwidgetlogo.png',
              text: 'Discover the top Flutter Designers & Developers',
            ),
            ButtonsContainer(
              width: width,
              onSignWithGoogle: () {},
              onSignIn: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Signin(),
                  ),
                );
              },
              onSignUp: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Signup(),
                  ),
<<<<<<< HEAD
                );
              },
=======
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
                      width: width*0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow:[BoxShadow(
                          color: Color(0xff6F29E6),
                          spreadRadius: 2.0,
                          blurRadius: 4.0,
                          offset: Offset(0,4),
                        )]
                      ),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        onPressed: (){
                          signInWithGoogle().then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                          }).catchError((err){
                            print(err);
                            Alert(
                                context: context,
                                type: AlertType.error,
                                title: 'Something wrong',
                                buttons: [
                                  DialogButton(
                                    child: Text('Okay'),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    color: Color(0xffF1009C),
                                  )
                                ]
                            ).show();
                          });
                        },
                        color: Colors.white,
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width:30.0,height: 30.0,
                                  child: Image.asset('assets/google.png',fit: BoxFit.fill,)),
                              SizedBox(width: 15.0,),
                              Text('Sign-in with Google')
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Text('Or with Email',style: TextStyle(
                      fontSize: 15.0,color: Color(0xffC4C4C4),
                    )),
                    SizedBox(height: 15.0,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow:[BoxShadow(
                                  color: Color(0xff6F29E6),
                                  spreadRadius: 1.0,
                                  blurRadius: 8.0,
                                  offset: Offset(4,4),
                                )]
                            ),
                            child: RaisedButton(
                              color: Color(0xffF1009C),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Sign in',style: TextStyle(
                                  fontSize: 20.0,color: Color(0xffC4C4C4),
                                ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow:[BoxShadow(
                                  color: Color(0xff6F29E6),
                                  spreadRadius: 1.0,
                                  blurRadius: 8.0,
                                  offset: Offset(4,4),
                                )]
                            ),
                            child: RaisedButton(
                              color: Color(0xffF1009C),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Sign up',style: TextStyle(
                                  fontSize: 20.0,color: Color(0xffC4C4C4),
                                ),
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
>>>>>>> dc1520560fea9e28561768059db3e3e0fcabe6b3
            )
          ],
        ),
      ),
    );
  }
}
