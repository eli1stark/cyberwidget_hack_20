import 'package:cyberwidget_hack_20/screens/home/home.dart';
import 'package:cyberwidget_hack_20/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController email,password;
  bool ispswd=true;
  ProgressDialog pd;
  @override
  void initState() {
    super.initState();
    email=TextEditingController(text: '');
    password=TextEditingController(text: '');
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    pd=ProgressDialog(context);
    pd.style(message: 'Please wait...');
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: Stack(
            children: [
              Container(
                width: width,
                height: height,
                child: Image.asset('assets/signin.png',fit: BoxFit.fill,),
              ),
              Container(
                width: width,
                height: height,
                child: Image.asset('assets/design.png',fit: BoxFit.fill,),
              ),
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(4, 137, 178, 0.9),
                          Color.fromRGBO(26, 5, 62, 0.9),
                        ]
                    )
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left:15.0,top: 30.0),
                  child: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,),onPressed: (){
                    Navigator.pop(context);
                  },),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: width*0.8,
                  height: height,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height*0.3,
                        ),
                        TextField(
                          controller: email,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                                color: Colors.white
                            ),
                            suffixIcon: Icon(Icons.email,color: Colors.white,),
                            //border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
                          ),
                        ),
                        SizedBox(height: 15.0,),
                        TextField(
                          controller: password,
                          cursorColor: Colors.white,
                          obscureText: ispswd,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: Colors.white
                              ),
                              suffixIcon: IconButton(icon: Icon(Icons.vpn_key,color: Colors.white,),onPressed: (){
                                setState(() {
                                  ispswd=!ispswd;
                                });
                              },),
                          ),
                        ),
                        SizedBox(height: height*0.1,),
                        Container(
                          width: width*0.5,
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
                            onPressed: () async {
                              if(email.text.isEmpty || password.text.isEmpty){
                                Alert(
                                  context: context,
                                  type: AlertType.warning,
                                  title: 'Fill all the fields',
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
                              }
                              else{
                                pd.show();
                                bool val= await firebaseauth().signinauth(email.text,password.text);
                                if(val){
                                  pd.hide();
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                                }else{
                                  pd.hide();
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
                                }
                                email.clear();
                                password.clear();
                              }
                            },
                            color: Color(0xffF1009C),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text('Login',style: TextStyle(
                                  color: Colors.white
                              ),),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}



