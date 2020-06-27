import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController email,password;
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
    return Scaffold(
      body: Container(
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
                        decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                color: Colors.white
                            ),
                            suffixIcon: Icon(Icons.vpn_key,color: Colors.white,)
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
                          onPressed: (){

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

    );
  }
}



