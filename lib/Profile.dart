import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xspectre/help/appBar.dart';

import 'AddVideos.dart';
import 'Home.dart';
import 'Styles.dart';
import 'Videos.dart';
import 'Community.dart';
import 'JoinUs.dart';
import 'Squad.dart';
import 'T&C.dart';
import 'help/IsPhone.dart';

class Profile extends StatefulWidget {
  static const String route = '/profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = "";
  String photo = "";
  SharedPreferences homePrefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Container(
          width: MediaQuery.of(context).size.width * 0.5,//20.0,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child:SingleChildScrollView(
              child:Column(
                  children:<Widget>[
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => Home())  ,
                        );
                      },
                    ),
                    ListTile(
                        leading: Icon(Icons.face),
                        title: Text("Community"),
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => Community())  ,
                          );

                        }),
                    ListTile(
                      leading: Icon(Icons.filter),
                      title: Text("Videos"),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => VideoPage()));                        },
                    ),
                    ListTile(
                      leading: Icon(Icons.people),
                      title: Text("Squad"),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => Squad())  ,
                        );
                      },
                    ),
                    ListTile(
                      title: Text("Join Us"),
                      leading: FaIcon(FontAwesomeIcons.headset),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => JoinUs())  ,
                        );
                      },
                    ),
                    ListTile(
                        leading:FaIcon(FontAwesomeIcons.scroll) ,
                        title: Text("T&C"),
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => Terms())  ,
                          );
                        }),
                    ListTile(
                      leading: Icon(Icons.add),
                      title: Text("Add Videos"),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => AddVideos())  ,
                        );
                      },
                    ),
                    Container(
                      color: Colors.grey,
                      child: ListTile(
                        leading: Icon(Icons.account_circle),
                        title: Text("Profile"),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ]
              )
          )
      ),
      body: SettingsScreen(),
    );
  }

}
class SettingsScreen extends StatefulWidget {
  @override
  State createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  TextEditingController controllerNickname;
  TextEditingController controllerAboutMe;

  SharedPreferences prefs;

  String id = '';
  String nickname = '';
  String photoUrl = '';
  int points = 0;

  bool isLoading = false;
  File avatarImageFile;

  final FocusNode focusNodeNickname = FocusNode();
  final FocusNode focusNodeAboutMe = FocusNode();

  @override
  void initState() {
    super.initState();
    readLocal();
  }

  void readLocal() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id') ?? '';
    nickname = prefs.getString('nickname').toString();
    print(nickname);
    points = 0;
    photoUrl = prefs.getString('photoUrl') ?? '';
    print(photoUrl);

    controllerNickname = TextEditingController(text: nickname);
    controllerAboutMe = TextEditingController(text: points.toString());

    // Force refresh input
    setState(() {});
  }



  void handleUpdateData() {
    focusNodeNickname.unfocus();
    focusNodeAboutMe.unfocus();

    setState(() {
      isLoading = true;
    });

    Firestore.instance
        .collection('users')
        .document(id)
        .updateData({'nickname': nickname,'photoUrl': photoUrl}).then((data) async {
      await prefs.setString('nickname', nickname);
      await prefs.setString('photoUrl', photoUrl);

      setState(() {
        isLoading = false;
      });

    }).catchError((err) {
      setState(() {
        isLoading = false;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image:NetworkImage("https://i.pinimg.com/originals/e4/a9/58/e4a958cc1746777cf1283588c10a9bf0.jpg")
          )
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height:uniHeight(context),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height:40),
                  Container(
                    child: Center(
                      child: (avatarImageFile == null)
                          ? (photoUrl != ''
                          ? Material(
                        child: Image.network(
                          photoUrl,
                          width: 150.0,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        clipBehavior: Clip.hardEdge,
                      )
                          : Icon(
                        Icons.account_circle,
                        size: 150.0,
                        color: Colors.grey,
                      ))
                          : Material(
                        child: Image.file(
                          avatarImageFile,
                          width: 150.0,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(45.0)),
                      ),
                    ),
                    width:double.infinity,
                    margin: EdgeInsets.all(20.0),
                  ),

                  // Input
                  Column(
                    children: <Widget>[
                      // Username
                      Container(
                        child: Text(
                          'Nickname',
                          style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                        margin: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 10.0),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.56,
                        child: Theme(
                          data: Theme.of(context).copyWith(primaryColor: Colors.red),
                          child: Container(
                            color: Colors.white,
                            child: TextField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: 'Dank Gamer',
                                contentPadding: EdgeInsets.all(5.0),
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              controller: controllerNickname,
                              onChanged: (value) {
                                nickname = value;
                              },
                              focusNode: focusNodeNickname,
                            ),
                          ),
                        ),
                        margin: EdgeInsets.only(left: 20.0, right: 30.0),
                      ),

                      // About me
                      Container(
                        child: Text(
                          'Points',
                          style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                        margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                      ),
                      Container(
                        child: Theme(
                            data: Theme.of(context).copyWith(primaryColor:Colors.red),
                            child: Text(points.toString(),style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),)
                        ),
                        margin: EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),

                  // Button
                  Container(
                    child: FlatButton(
                      onPressed: handleUpdateData,
                      child: Text(
                        'UPDATE',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      color: Colors.red,
                      highlightColor: Color(0xff8d93a0),
                      splashColor: Colors.transparent,
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                    ),
                    margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
                  ),
                  SizedBox(height: 40,),
                  Container(
                      height:uniHeight(context)*0.4,
                      width:uniWidth(context),
                      color:Colors.lightBlue,
                      child:Row(
                          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                          children:socials1
                      )
                  ),
                ],
              ),
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
            ),
          ),

          // Loading
          Positioned(
            child: isLoading
                ? Container(
              child: Center(
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
              ),
              color: Colors.white.withOpacity(0.8),
            )
                : Container(),
          ),
        ],
      ),
    );
  }
}