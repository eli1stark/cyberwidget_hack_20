import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as Path;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class Chatview extends StatefulWidget {
  String myid,usid,otherusername;
  Chatview(this.myid,this.usid,this.otherusername);
  @override
  _ChatviewState createState() => _ChatviewState();
}

class _ChatviewState extends State<Chatview> {
  TextEditingController msg,ttle,flname;
  File file;
  static final key=new GlobalKey<ScaffoldState>();
  ScrollController _scrollController=ScrollController();
  var startstpry;
  var rec;
  var listMessage;
  var groupChatId;
  List<String> dt=['Settings','Block','Add files'];
  bool chatstry=false;
  String userdata='';
  DateTime _dateTimet=DateTime.fromMillisecondsSinceEpoch(int.parse(DateTime.now().millisecondsSinceEpoch.toString()));
  ProgressDialog pd;
  bool isblock=false;
  bool isblockedby=false;


  @override
  void initState(){
    rec=widget.usid;
    msg=TextEditingController(text: '');
    ttle=TextEditingController(text: '');
    flname=TextEditingController(text: '');
    super.initState();
    serr();
  }

  serr(){
    if(widget.myid.hashCode<=widget.usid.hashCode){
      setState(() {
        groupChatId='${widget.myid}-${widget.usid}';
      });
      return groupChatId;
    }else{
      setState(() {
        groupChatId='${widget.usid}-${widget.myid}';
      });
      return groupChatId;
    }
  }

  bool me=false;
  @override
  Widget build(BuildContext context) {
    pd = ProgressDialog(context);
    pd.style(
      message: 'Please wait',
      elevation: 6.0,
      borderRadius: 2.0,
    );
    if(widget.myid.hashCode<=widget.usid.hashCode){
      setState(() {
        groupChatId='${widget.myid}-${widget.usid}';
      });
    }else{
      setState(() {
        groupChatId='${widget.usid}-${widget.myid}';
      });
    }
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      key: key,
      appBar: AppBar(backgroundColor: Colors.lightBlue,
        //title here
        title: Text(widget.otherusername,style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          //todo here is the popup menu
          PopupMenuButton<String>(
              elevation: 3.0,
              onSelected: _selected,
              itemBuilder:(BuildContext context){
                return dt.map((f){
                  return PopupMenuItem<String>(
                    value: f,
                    child: Text(f),
                  );
                }).toList();
              }
          ),
          SizedBox(width: 20.0,),
        ],
      ),
      body:Center(
        child: SingleChildScrollView(
          controller: _scrollController,
          reverse: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: height*0.836,
                width: width,
                child: StreamBuilder(
                  stream: Firestore.instance
                      .collection('Messages')
                      .document(groupChatId)
                      .collection(groupChatId)
                      .orderBy('timestamp', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                          child: Text(''));
                    } else {
                      listMessage = snapshot.data.documents;
                      return ListView.builder(
                        padding: EdgeInsets.all(10.0),
                        itemBuilder: (context, index) => buildItem(index, snapshot.data.documents[index],width),
                        itemCount: snapshot.data.documents.length,
                        reverse: true,
                      );
                    }
                  },
                ),

              ),

              Center(
                child: Container(
                  width: width,
                  child:Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget>[
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: TextField(
                            controller: msg,
                            decoration: InputDecoration(
                                hintText: 'Type your message',
                                hintStyle: TextStyle(
                                    fontSize: 20.0
                                ),
                                suffixIcon: Icon(Icons.camera_alt,size: 20.0,)
                            ),
                          ),
                        ),
                        IconButton(
                            icon: Icon(Icons.send, size: 20.0,),
                            onPressed: () async{
                              print(widget.usid);
                              await Firestore.instance.collection('/Messages').document(groupChatId).
                              collection(groupChatId).
                              add({'Sender':widget.myid,'Receiver':widget.usid,
                                'Message':msg.text,'timestamp':DateTime.now().millisecondsSinceEpoch.
                                toString()}).catchError((e){
                                print(e);//home page data has to be changed when we
                                // have to implement in firestore
                              });
                              msg.clear();
                              _scrollController.animateTo(_scrollController.position.maxScrollExtent,
                                  duration: Duration(milliseconds: 300), curve: Curves.easeOut);
                            }
                        ),
                      ]
                  ),

                ),
              ),
              SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildItem(int index, DocumentSnapshot document,double width) {
    var now=document['timestamp'];
    bool isfile=false;
    var url='';
    var filename='';
    var text='';
    if(document['Message']=='1234Message4321'){
      isfile=true;
      url=document['fileurl'];
      filename=document['filename'];
      var le=filename.length;
      if(le<20){
        text=filename;
      }else{
        for(var i=0;i<=18;i++){
          text+=filename[i];
        }
        text+='...';
      }
    }
    var today=new DateTime.now().millisecondsSinceEpoch.toString();
    DateTime tody=DateTime.fromMillisecondsSinceEpoch(int.parse(today));
    bool td=false,to=false;
    DateTime dd=DateTime.fromMillisecondsSinceEpoch(int.parse(now));
    if(DateFormat("dd/MM/yyyy").format(dd)!=DateFormat("dd/MM/yyyy").format(tody) &&
        DateFormat("dd/MM/yyyy").format(dd)!=DateFormat("dd/MM/yyyy").format(_dateTimet)){
      td=true;
    }
    if(DateFormat("dd/MM/yyyy").format(dd)==DateFormat("dd/MM/yyyy").format(tody) &&
        DateFormat("dd/MM/yyyy").format(dd)!=DateFormat("dd/MM/yyyy").format(_dateTimet)){
      to=true;
    }
    if(document['Sender']==widget.myid){
      me=true;
    }else{
      me=false;
    }
    _dateTimet=dd;

    return Column(
      crossAxisAlignment: me?CrossAxisAlignment.end:CrossAxisAlignment.start,
      children: <Widget>[
        td?Center(child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.grey),
          padding: EdgeInsets.only(left: 10.0,top: 10.0,right: 10.0,bottom: 10.0),
          child: Text(DateFormat("dd/MM/yyyy").format(dd),style: TextStyle(
            fontSize: 10.0,
          ),),
        )):to?Center(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.grey),
            padding: EdgeInsets.only(left: 10.0,top: 10.0,right: 10.0,bottom: 10.0),
            child: Text('Today',style: TextStyle(
              fontSize: 10.0,
            ),),
          ),
        ):Text(''),
        SizedBox(height: 10.0,),
        isfile?Container(
          width: 200.0,
          height: 60.0,
          decoration: BoxDecoration(color: me?Colors.lightBlue:Colors.purple, borderRadius: BorderRadius.circular(8.0)),
          child: GestureDetector(
            onTap: (){
              if(canLaunch(url) != null){
                launch(url);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(Icons.file_download,color:Colors.black,),
                  ),
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),),
                  SizedBox(width: 15.0,),
                  Center(
                    child: Text(text,style: TextStyle(
                      color:me?Colors.black:Colors.white,
                      fontSize: 15.0,
                    ),),
                  )
                ],
              ),
            ),
          ),
        ):Container(
          child: Text(
            document['Message'],
            style: TextStyle(
              color:me?Colors.black:Colors.white,
              fontSize: 15.0,
            ),
          ),
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          decoration: BoxDecoration(color: me?Colors.lightBlue:Colors.purple, borderRadius: BorderRadius.circular(8.0)),
        ),
        Text( DateFormat('h:mm a').format(dd),
          style: TextStyle(
            fontSize: 10.0,
          ),),
        SizedBox(height: 20.0,),
      ],
    );
  }

  Future<void> _selected(String value) async {
    if(value==dt[0]){
      print('Settings');
    }
    else if(value==dt[2]){
      Alert(
          context: context,
          title: 'Enter the name',
          type: AlertType.info,
          content: TextField(
            controller: flname,
            decoration: InputDecoration(
              hintText: 'File name',
              suffixIcon: Icon(Icons.library_books),
            ),
          ),
          buttons: [
            DialogButton(
              child: Text('Next->'),
              onPressed: () async {
                Navigator.pop(context);
                file = await FilePicker.getFile();
                StorageReference sr = FirebaseStorage.instance
                    .ref()
                    .child("${Path.basename(file.path)}");
                StorageUploadTask uptsk = sr.putFile(file);
                pd.show();
                await uptsk.onComplete;
                sr.getDownloadURL().then((suc) {
                  pd.hide();
                  print(suc);
                  Firestore.instance
                      .collection("Messages")
                      .document(groupChatId)
                      .collection(groupChatId)
                      .add({
                    'fileurl': suc.toString(),
                    'Sender':userdata,'Receiver':rec,'Message':'1234Message4321',
                    'filename': flname.text,
                    'timestamp':DateTime.now().millisecondsSinceEpoch.toString()
                  });
                  Alert(
                      context: context,
                      title: 'Successfully uploaded',
                      type: AlertType.success,
                      buttons: [
                        DialogButton(
                          child: Text('Okay'),
                          onPressed: (){
                            flname.clear();
                            Navigator.pop(context);
                          },
                        ),
                      ]
                  ).show();
                }).catchError((err) {
                  pd.hide();
                  Alert(
                      context: context,
                      title: 'Error',
                      type: AlertType.error,
                      desc: '$err')
                      .show();
                });
              },
            ),
          ]).show();
    }
    else{
      print('nothing');
    }
  }
}