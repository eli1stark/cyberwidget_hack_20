import 'package:flutter/material.dart';

//here i tried stateless widget but thats not working statically so i moved it to statefullwidget
class Postlist extends StatefulWidget {
  var co,url;
  Postlist(this.url,this.co);

  @override
  _PostlistState createState() => _PostlistState();
}

class _PostlistState extends State<Postlist> {

  @override
  void initState() {
    print(widget.url['url']);
    print('hello');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Container(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: width*0.4,
              height: height*0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff6F29E6),
                        spreadRadius: 2.0,
                        blurRadius: 4.0,
                        offset: Offset(0, 4),
                      )
                    ]),
              child: Image.network(widget.url['url'],fit: BoxFit.fill,),
            ),
            Container(
              width: width*0.4,
              height: height*0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff6F29E6),
                        spreadRadius: 2.0,
                        blurRadius: 4.0,
                        offset: Offset(0, 4),
                      )
                    ]),
              child: Image.network(widget.co['url'],fit: BoxFit.fill,),
            ),
          ],
        ),
      ),
    );
  }
}
