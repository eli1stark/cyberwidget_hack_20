
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberwidget_hack_20/components/top_navbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class AddProject extends StatefulWidget {
  static const routeName = '/add_project';
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  TextEditingController title,description,gitlink,tag1,tag2;
  File img1,img2,img3,img4;
  var Listofimages=[];
  ProgressDialog pd;
  var currentuid,username;

  getcurrentdetails() async{
    FirebaseUser user=await FirebaseAuth.instance.currentUser();
    var uid=user.uid;
    await Firestore.instance.collection('users').document(uid).get().then((value) {
      setState(() {
        username=value.data['about']['username'];
        currentuid=uid;
      });
    }).catchError((err){
      print('Error $err');
    });


  }


  List<String> ls=['Arts & Design','Augmented Reality','Auto & Vehicles','Beauty','Books','Business','Comics'
    ,'Communication','Dating','Daydream','Education','Entertainment','Events','Finance','Food & Drinks'
    ,'Health & Fitness','House','Libraries','Lifestyle','Maps & Navigation','Medical','Music & Audio'
    ,'News & Magaziness','parenting','Personalisation','Photography','Productivity','Shopping','Social'
    ,'Sports','Tools','Travel & Local','UI Design','UI/UX Design','Video Players','Wear Os','Weather',];


  var currenttag1,currenttag2;
  @override
  void initState() {
    currenttag1=ls[0];
    currenttag2=ls[0];
    title=TextEditingController(text: "");
    description=TextEditingController(text: "");
    gitlink=TextEditingController(text: "");
    super.initState();
    getcurrentdetails();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    pd = ProgressDialog(context);
    pd.style(
      message: 'Please wait',
      elevation: 6.0,
      borderRadius: 2.0,
    );
    return Scaffold(
      appBar: PreferredSize(
        child: TopNavBar(
          iconLeft: Icons.arrow_back,
          iconRight: Icons.more_vert,
          fontAwesomeLeft: false,
          fontAwesomeRight: false,
          onTapLeft: () {
            Navigator.pop(context);
          },
          onTapRight: () {},
          title: Text("Add Project"),
          centerTitle: true,
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: Container(
            width: width*0.9,
            height: height,
            child: Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10.0),
              child: Column(
                children: [
                  SizedBox(height: 20.0,),
                  TextField(
                    controller: title,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextField(
                    controller: description,
                    maxLines: 2,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Description',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextField(
                    controller: gitlink,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'GitHub Link',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tag1',style: TextStyle(color: Colors.white,fontSize: 15.0),),
                      DropdownButton<String>(
                        elevation: 6,
                        items: ls.map((String tag1val){
                          return DropdownMenuItem<String>(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                              child: Text(tag1val),
                            ),
                            value: tag1val,
                          );
                        }).toList(),
                        onChanged: (String val){
                          setState(() {
                            this.currenttag1=val;
                          });
                          print(val);
                        },
                        value: currenttag1,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tag1',style: TextStyle(color: Colors.white,fontSize: 15.0),),
                      DropdownButton<String>(
                        elevation: 6,
                        items: ls.map((String tag1val){
                          return DropdownMenuItem<String>(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                              child: Text(tag1val),
                            ),
                            value: tag1val,
                          );
                        }).toList(),
                        onChanged: (String val){
                          setState(() {
                            this.currenttag2=val;
                          });
                          print(val);
                        },
                        value: currenttag2,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  GestureDetector(
                    onTap: () async{
                      if(Listofimages.length<5){
                        img1 = await FilePicker.getFile();
                        StorageReference sr = FirebaseStorage.instance
                            .ref()
                            .child("${Path.basename(img1.path)}");
                        StorageUploadTask uptsk = sr.putFile(img1);
                        pd.show();
                        await uptsk.onComplete;
                        sr.getDownloadURL().then((suc) {
                          pd.hide();
                          print(suc);
                          setState(() {
                            Listofimages.add(suc.toString());
                          });
                          Alert(
                              context: context,
                              title: 'Uploaded Image1',
                              type: AlertType.success,
                              buttons: [
                                DialogButton(
                                  child: Text('Okay'),
                                  color: Color(0xffF1009C),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                              ]
                          ).show();
                        }).catchError((err){
                          pd.hide();
                          Alert(
                              context: context,
                              title: 'Error',
                              type: AlertType.error,
                              buttons: [
                                DialogButton(
                                  child: Text('Okay'),
                                  color: Color(0xffF1009C),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                              ]
                          ).show();
                        });
                      }
                    },
                    child: Container(
                      width: width*0.78,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0xffF1009C),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text('Image1')),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  GestureDetector(
                    onTap: () async{
                      if(Listofimages.length<5){
                        img2 = await FilePicker.getFile();
                        StorageReference sr = FirebaseStorage.instance
                            .ref()
                            .child("${Path.basename(img2.path)}");
                        StorageUploadTask uptsk = sr.putFile(img2);
                        pd.show();
                        await uptsk.onComplete;
                        sr.getDownloadURL().then((suc) {
                          pd.hide();
                          print(suc);
                          setState(() {
                            Listofimages.add(suc.toString());
                          });
                          Alert(
                              context: context,
                              title: 'Uploaded Image2',
                              type: AlertType.success,
                              buttons: [
                                DialogButton(
                                  child: Text('Okay'),
                                  color: Color(0xffF1009C),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                              ]
                          ).show();
                        }).catchError((err){
                          pd.hide();
                          Alert(
                              context: context,
                              title: 'Error',
                              type: AlertType.error,
                              buttons: [
                                DialogButton(
                                  child: Text('Okay'),
                                  color: Color(0xffF1009C),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                              ]
                          ).show();
                        });
                      }
                    },
                    child: Container(
                      width: width*0.78,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0xffF1009C),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text('Image2')),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  GestureDetector(
                    onTap: () async{
                      if(Listofimages.length<5){
                        img3 = await FilePicker.getFile();
                        StorageReference sr = FirebaseStorage.instance
                            .ref()
                            .child("${Path.basename(img3.path)}");
                        StorageUploadTask uptsk = sr.putFile(img3);
                        pd.show();
                        await uptsk.onComplete;
                        sr.getDownloadURL().then((suc) {
                          pd.hide();
                          print(suc);
                          setState(() {
                            Listofimages.add(suc.toString());
                          });
                          Alert(
                              context: context,
                              title: 'Uploaded Image3',
                              type: AlertType.success,
                              buttons: [
                                DialogButton(
                                  child: Text('Okay'),
                                  color: Color(0xffF1009C),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                              ]
                          ).show();
                        }).catchError((err){
                          pd.hide();
                          Alert(
                              context: context,
                              title: 'Error',
                              type: AlertType.error,
                              buttons: [
                                DialogButton(
                                  child: Text('Okay'),
                                  color: Color(0xffF1009C),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                              ]
                          ).show();
                        });
                      }
                    },
                    child: Container(
                      width: width*0.78,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0xffF1009C),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text('Image3')),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  GestureDetector(
                    onTap: () async{
                      if(Listofimages.length<5){
                        img4 = await FilePicker.getFile();
                        StorageReference sr = FirebaseStorage.instance
                            .ref()
                            .child("${Path.basename(img4.path)}");
                        StorageUploadTask uptsk = sr.putFile(img4);
                        pd.show();
                        await uptsk.onComplete;
                        sr.getDownloadURL().then((suc) {
                          pd.hide();
                          print(suc);
                          setState(() {
                            Listofimages.add(suc.toString());
                          });
                          Alert(
                              context: context,
                              title: 'Uploaded Image4',
                              type: AlertType.success,
                              buttons: [
                                DialogButton(
                                  child: Text('Okay'),
                                  color: Color(0xffF1009C),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                              ]
                          ).show();
                        }).catchError((err){
                          pd.hide();
                          Alert(
                              context: context,
                              title: 'Error',
                              type: AlertType.error,
                              buttons: [
                                DialogButton(
                                  child: Text('Okay'),
                                  color: Color(0xffF1009C),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                              ]
                          ).show();
                        });
                      }
                    },
                    child: Container(
                      width: width*0.78,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0xffF1009C),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text('Image4')),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                        onPressed: () async{
                          print(username);
                          print(currentuid);
                          if(title.text.isEmpty || description.text.isEmpty || gitlink.text.isEmpty){
                            Alert(
                              context: context,
                              title: 'Enter all the fields',
                              type: AlertType.warning,
                                buttons: [
                                  DialogButton(
                                    child: Text('Okay'),
                                    color: Color(0xffF1009C),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                  ),
                                ]
                            ).show();
                          }else if(Listofimages.length<4){
                            Alert(
                                context: context,
                                title: 'Upload 4 images',
                                type: AlertType.warning,
                                buttons: [
                                  DialogButton(
                                    child: Text('Okay'),
                                    color: Color(0xffF1009C),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                  ),
                                ]
                            ).show();
                          }else if(username==null || currentuid==null){
                            Alert(
                                context: context,
                                title: 'Something wrong',
                                type: AlertType.warning,
                                buttons: [
                                  DialogButton(
                                    child: Text('Okay'),
                                    color: Color(0xffF1009C),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                  ),
                                ]
                            ).show();
                          }else{
                            pd.show();
                            await Firestore.instance.collection('posts').document(currentuid).setData({
                              'description':description.text,
                              'gitLink':gitlink.text,
                              'photo1':Listofimages[0],
                              'photo2':Listofimages[1],
                              'photo3':Listofimages[2],
                              'photo4':Listofimages[3],
                              'tag1':currenttag1,
                              'tag2':currenttag2,
                              'title':title.text,
                              'uid':currentuid,
                              'username':username,
                              'time':DateTime.now().millisecondsSinceEpoch.toString(),
                            }).then((value) {
                              pd.hide();
                              Alert(
                                  context: context,
                                  title: 'Successfully uploaded',
                                  type: AlertType.success,
                                  buttons: [
                                    DialogButton(
                                      child: Text('Okay'),
                                      color: Color(0xffF1009C),
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ]
                              ).show();
                            }).catchError((err){
                              pd.hide();
                              Alert(
                                  context: context,
                                  title: 'Something wrong',
                                  type: AlertType.error,
                                  buttons: [
                                    DialogButton(
                                      child: Text('Okay'),
                                      color: Color(0xffF1009C),
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ]
                              ).show();
                            });
                          }
                          description.clear();
                          title.clear();
                          gitlink.clear();
                          Listofimages.clear();
                        },
                        color: Colors.purpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Submit'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
