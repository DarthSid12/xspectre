import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xspectre/JoinUs.dart';
import 'package:xspectre/help/Footer.dart';
import 'package:xspectre/help/appBar.dart';
import 'package:youtube_parser/youtube_parser.dart';
import 'Community.dart';
import 'Home.dart';
import 'Squad.dart';
import 'Styles.dart';
import 'T&C.dart';
import 'Videos.dart';
import 'help/IsPhone.dart';
import 'help/UpperCLassTextFormatter.dart';
class AddVideos extends StatefulWidget {
  static const String route = '/add-videos';
  @override
  _AddVideosState createState() => _AddVideosState();
}
String type ='MONTAGES';
class _AddVideosState extends State<AddVideos> {
  String video ='';
  GlobalKey<FormState> key1 = GlobalKey<FormState>();
  GlobalKey<FormState> key2 = GlobalKey<FormState>();
  GlobalKey<FormState> key3 = GlobalKey<FormState>();
  String game ='';
  String title ='';
  String creator ='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child:SingleChildScrollView(
              child:Column(
                  children:<Widget>[
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                      onTap: () {
                        Navigator.of(context).pushNamed(Home.route);
                      },
                    ),
                    ListTile(
                        leading: Icon(Icons.face),
                        title: Text("Community"),
                        onTap: () {
                          Navigator.of(context).pushNamed(Community.route);
                        }),
                    ListTile(
                      leading: Icon(Icons.filter),
                      title: Text("Videos"),
                      onTap: () {
                        Navigator.of(context).pushNamed(VideoPage.route);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.people),
                      title: Text("Squad"),
                      onTap: () {
                        Navigator.of(context).pushNamed(Squad.route);
                      },
                    ),
                    ListTile(
                        leading: FaIcon(FontAwesomeIcons.headset),
                        title: Text("Join Us"),
                        onTap: () {
                          Navigator.of(context).pushNamed(JoinUs.route);
                        }
                        )
                   ,
                    ListTile(
                      leading:FaIcon(FontAwesomeIcons.scroll) ,
                      title: Text("T&C"),
                      onTap: () {
                        Navigator.of(context).pushNamed(Terms.route);
                      },
                    ),
                    Container(
                      color: Colors.grey[400],
                      child: ListTile(

                        leading: Icon(Icons.add),
                        title: Text("Add Videos"),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    // ListTile(
                    //   leading: Icon(Icons.account_circle),
                    //   title: Text("Profile"),
                    //   onTap: () {
                    //     Navigator.pushReplacement(context, MaterialPageRoute(
                    //         builder: (context) => Profile()));
                    //   },
                    // ),
                  ]
              )
          )
      ),
      body: Container(
    constraints: BoxConstraints.expand(),
    decoration: BoxDecoration(
    image: DecorationImage(fit:BoxFit.cover,image: AssetImage("images/AstroBg.jpg"))
    ),
    child: SingleChildScrollView(
       child: Column(
         children: <Widget>[
           appBar("Add Videos", context),
           SizedBox(height:20),
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Padding(
                 padding: const EdgeInsets.fromLTRB(0,0,220,0),
                 child: Text("Add a Video",style: TextStyle(
                     letterSpacing: 4,
                     fontFamily : "Heading3",
                     color: Colors.white,
                     fontSize: 50
                 ),),
               ),
             ],
           ),
           SizedBox(height:20),
           Center(
             child: Padding(
               padding: const EdgeInsets.fromLTRB(350,0,0,0),
               child: Container(
                 width: 600,
                  child: Container(

                   decoration: BoxDecoration(
                     border: Border.all(width: 8,color: Colors.white,style: BorderStyle.solid),
                       borderRadius: BorderRadius.all(Radius.circular(18))
                   ),
                   child: Padding(
                     padding: isLaptop(context)?EdgeInsets.fromLTRB(54,24,24,24):EdgeInsets.all(24.0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: <Widget>[
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text("VIDEO URL",style:TextStyle(
                               color:Colors.white,
                               fontSize: 16,
                               fontWeight: FontWeight.bold,
                               // letterSpacing:3
                             )),
                           ],
                         ),
                         SizedBox(height:10),
                         Row(
                           children: [
                             Container(
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                 borderRadius: BorderRadius.all(Radius.circular(5))
                               ),
                               height:50,
                               width: 375,
                               child: Padding(
                                 padding: const EdgeInsets.fromLTRB(5,0,0,0),
                                 child: Form(
                                   child: TextFormField(
                                       inputFormatters: [
                                         UpperCaseTextFormatter(),
                                       ],
                                     validator: (val){
                                       if (val =="" || val == null){
                                         return "This field is necessary";
                                       }
                                       return null;
                                     },
                                     style: addVideosInput,
                                     keyboardType: TextInputType.url,
                                     onChanged: (text) {
                                       video = text;
                                     },

                                     decoration: const InputDecoration(
                                       border: InputBorder.none,
                                       focusedBorder: InputBorder.none,
                                       hintText: 'URL TO YOUR VIDEO',
                                       hintStyle: TextStyle(
                                         color:Colors.grey,
                                         fontSize: 14,
                                         fontFamily: "Lulo",
                                         letterSpacing: 1.2,
                                         fontWeight: FontWeight.bold,
                                       )
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height:25),
                         Row(
                           children: [
                             Text("Title",style:TextStyle(
                                 color:Colors.white,
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold,
                                 // letterSpacing:3
                             ))
                           ],
                         ),
                         SizedBox(height:10),
                         Row(
                           children: [
                             Container(
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.all(Radius.circular(5))
                               ),
                               height:50,
                               width: 375,
                               child: Padding(
                                 padding: const EdgeInsets.fromLTRB(5,0,0,0),
                                 child: Form(
                                   child: TextFormField(
                                     inputFormatters: [
                                       UpperCaseTextFormatter(),
                                     ],
                                     validator: (val){
                                       if (val =="" || val == null){
                                         return "This field is necessary";
                                       }
                                       return null;
                                     },
                                     style:  addVideosInput,
                                     keyboardType: TextInputType.text,
                                     onChanged: (text) {
                                       title = text;
                                     },
                                     decoration: const InputDecoration(
                                       border: InputBorder.none,
                                       hintText: 'DISPLAY TITLE',
                                         hintStyle:TextStyle(
                                       color:Colors.grey,
                                       fontSize: 14,
                                       fontWeight: FontWeight.bold,
                                     ),
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height:25),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text("Type",style:TextStyle(
                                 color:Colors.white,
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold,
                                 // letterSpacing:3
                             )),
                           ],
                         ),
                         SizedBox(height:10),
                         Row(
                           children: [
                             DropDownBox3(),
                           ],
                         ),
                         SizedBox(height:25),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text("Platform",style:TextStyle(
                                 color:Colors.white,
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold,
                                 // letterSpacing:3
                             )),
                           ],
                         ),
                         SizedBox(height:10),
                         Row(
                           children: [
                             DropDownBox4(),
                           ],
                         ),
                         SizedBox(height:25),
                         Row(
                           children: [
                             Text("GAME",style:TextStyle(
                                 color:Colors.white,
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold,
                                 // letterSpacing:3
                             )),
                           ],
                         ),
                         SizedBox(height:10),
                         Row(
                           children: [
                             Container(
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.all(Radius.circular(5))
                               ),
                               height:50,
                               width: 375,
                               child: Padding(
                                 padding: const EdgeInsets.fromLTRB(5,0,0,0),
                                 child: Form(
                                   child: TextFormField(
                                     inputFormatters: [
                                       UpperCaseTextFormatter(),
                                     ],
                                     style:  addVideosInput,
                                     keyboardType: TextInputType.text,
                                     onChanged: (text) {
                                       game = text;
                                     },
                                     decoration: const InputDecoration(
                                         border: InputBorder.none,
                                         hintText: 'GAME PLAYED',
                                         hintStyle: TextStyle(
                                           color:Colors.grey,
                                           fontSize: 14,
                                           fontWeight: FontWeight.bold,
                                         )
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),

                        SizedBox(height:25),
                         Row(
                           children: [
                             Text("CREATOR",style:TextStyle(
                                 color:Colors.white,
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold,
                                 // letterSpacing:3
                             )),
                           ],
                         ),
                         SizedBox(height:10),
                         Row(
                           children: [
                             Container(
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.all(Radius.circular(5))
                               ),
                               height:50,
                               width: 375,
                               child: Padding(
                                 padding: const EdgeInsets.fromLTRB(5,0,0,0),
                                 child: Form(
                                   child: TextFormField(
                                     inputFormatters: [
                                       UpperCaseTextFormatter(),
                                     ],
                                     style:  addVideosInput,
                                     keyboardType: TextInputType.text,
                                     onChanged: (text) {
                                       creator = text;
                                     },
                                     decoration: const InputDecoration(
                                         border: InputBorder.none,
                                         hintText: 'CHANNEL NAME',
                                         hintStyle: TextStyle(
                                           color:Colors.grey,
                                           fontSize: 14,
                                           fontWeight: FontWeight.bold,
                                         )
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height:25),

                         Padding(
                           padding: const EdgeInsets.fromLTRB(0,0,105,0),
                           child: Container(
                             decoration: BoxDecoration(
                                 color: Colors.white,
                             ),
                             child: Padding(
                               padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 45),
                               child: FlatButton(
                                 color: Colors.white,
                                 child: Text("SUBMIT",style: TextStyle(
                                   color: Colors.black,
                                   fontSize: 22,
                                   // letterSpacing: 0.5,
                                   fontFamily: "Lulo",
                                   fontWeight: FontWeight.bold,

                                 ),),
                                 onPressed: (){
                                   if (key1.currentState.validate() &&key2.currentState.validate() &&key3.currentState.validate() ) {
                                     Firestore.instance
                                         .collection('NewVideos')
                                         .add({
                                       "Link": platform.toLowerCase().startsWith(
                                           "y") ? getIdFromUrl(video) : video,
                                       "Type": type.toLowerCase(),
                                       "Game": game,
                                       "Name": title,
                                       "Platform": platform.toLowerCase(),
                                       "Creator": creator,
                                     });
                                   }
                                 },
                               ),
                             ),
                           ),
                         )
                       ],
                     ),
                   ),
               ),
           ),
             )
           ),
           SizedBox(height: 30,),
           Footer(context),
         ],
       ),
    )
      ),
    );
  }
}
Color visibleColor = Colors.grey;
Color visibleColor2 = Colors.grey;
class DropDownBox3 extends StatefulWidget {
  @override
  _DropDownBox3State createState() => _DropDownBox3State();
}

class _DropDownBox3State extends State<DropDownBox3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      width:375 ,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5,0,5,0),
        child: DropdownButton<String>(
          isExpanded:true,
          value:type,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,

          elevation: 16,
          style:  addVideosInput,
          underline: Container(

          ),
          onChanged: (String newValue) {
            setState(() {
              visibleColor = Colors.black;
              type = newValue;
            });
          },

          items: <String>['Montages', 'Trickshots', 'Stream', 'Memes','Walkthrough','Gameplay','Other']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value.toUpperCase(),
              child: Text(value.toUpperCase()),
            );
          }).toList(),
        ),
      ),
    );
  }
}
String platform ='YOUTUBE';
class DropDownBox4 extends StatefulWidget {
  @override
  _DropDownBox4State createState() => _DropDownBox4State();
}

class _DropDownBox4State extends State<DropDownBox4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5,0,5,0),
        child: DropdownButton<String>(
          isExpanded: true,
          value: platform,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style:  addVideosInput,
          underline: Container(
            height: 2,
          ),
          onChanged: (String newValue) {
            setState(() {
              visibleColor2 = Colors.black;
              platform = newValue;
            });
          },
          items: <String>['Youtube', 'Twitch', 'Instagram']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value.toUpperCase(),
              child: Text(value.toUpperCase()),
            );
          }).toList(),
        ),
      ),
    );
  }
}


