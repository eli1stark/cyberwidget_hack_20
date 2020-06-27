import 'package:cyberwidget_hack_20/components/tag_list.dart';
import 'package:flutter/material.dart';

class Taglist extends StatelessWidget {
  String tagvalue;
  Taglist(this.tagvalue);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0,),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(tagvalue,style: TextStyle(fontSize: 12.0),),
        )
      ),
    );
  }
}
class tagpopulation extends StatelessWidget {
  var element;
  tagpopulation(this.element);
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
