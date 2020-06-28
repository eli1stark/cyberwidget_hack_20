import 'package:cyberwidget_hack_20/screens/project/project.dart';
import 'package:flutter/material.dart';

class Postlist extends StatefulWidget {
  var document,index;
  Postlist(this.document,this.index);

  @override
  _PostlistState createState() => _PostlistState();
}

class _PostlistState extends State<Postlist> {

  var left=true;
  setpositionofwidget(){
    if(widget.index%2==0){
      setState(() {
        left=true;
      });
    }
    else{
      setState(() {
        left=false;
      });
    }
  }
  @override
  void initState() {
    setpositionofwidget();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProjectScreen(widget.document)));
        },
        child: Container(
          width: width*0.4,
          height: height*0.4,
          child: left?Stack(
            children: [
              Positioned(
                left: 20.0,
                top: 20.0,
                child: Container(
                  width: width*0.4,
                  height: height*0.35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff6F29E6),
                          spreadRadius: 4.0,
                          blurRadius: 4.0,
                          offset: Offset(0, 4),
                        )
                      ]),
                  child: Image.network(widget.document['photo1'],fit: BoxFit.fill,),
                ),
              ),
              Positioned(
                right: 20.0,
                top: 20.0,
                child: Container(
                  width: width*0.4,
                  height: height*0.35,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20.0,
                          ),
                          SizedBox(width: 15.0,),
                          Text(widget.document['username'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Expanded(
                        child: Text(widget.document['description'],
                          style: TextStyle(color: Colors.white70,),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ):Stack(
            children: [
              Positioned(
                right: 20.0,
                top: 20.0,
                child: Container(
                  width: width*0.4,
                  height: height*0.35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff6F29E6),
                          spreadRadius: 4.0,
                          blurRadius: 4.0,
                          offset: Offset(0, 4),
                        )
                      ]),
                  child: Image.network(widget.document['photo1'],fit: BoxFit.fill,),
                ),
              ),
              Positioned(
                left: 20.0,
                top: 20.0,
                child: Container(
                  width: width*0.4,
                  height: height*0.35,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20.0,
                          ),
                          SizedBox(width: 15.0,),
                          Text(widget.document['username'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Expanded(
                        child: Text(widget.document['description'],
                          style: TextStyle(color: Colors.white70,),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
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
