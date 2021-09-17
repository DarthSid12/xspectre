import 'package:flutter/material.dart';
import 'package:xspectre/AddVideos.dart';
import 'package:xspectre/Community.dart';
import 'package:xspectre/Home.dart';
import 'package:xspectre/JoinUs.dart';
import 'package:xspectre/Squad.dart';
import 'package:xspectre/Tournament.dart';
import 'package:xspectre/Videos.dart';
import 'package:xspectre/help/IsPhone.dart';

import '../Styles.dart';
import '../T&C.dart';

Container appBar(String currentPage, BuildContext context) {
  return Container(
    height: 60,
    width: uniWidth(context),
    decoration: BoxDecoration(
        color: Colors.black,
        border: Border.symmetric(
            vertical: BorderSide(color: Colors.white, width: 1))),
    child: isLaptop(context)
        ? Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                    ),
                    // Image(image: AssetImage("images/XspectreLogo.png")),
                    Text('X',
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: "Longless",
                          fontSize: 70,
                        )),
                    Text('spectre',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Longless",
                          fontSize: 50,
                        ))
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: uniWidth(context) * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      hoverButton(Home.route, "Home", currentPage),
                      hoverButton(VideoPage.route, "Videos", currentPage),
                      hoverButton(Community.route, "Community", currentPage),
                      // hoverButton(Squad.route, "Squad",currentPage),
                      hoverButton(
                          Tournaments.route, "Tournaments", currentPage),
                      hoverButton(JoinUs.route, "Join Us", currentPage),
                      hoverButton(AddVideos.route, "Add Videos", currentPage),
                      hoverButton(Terms.route, "T&C", currentPage),
                      SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        : Container(
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Builder(
                  builder: (context) => IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      }),
                ),
              ],
            ),
          ),
  );
}

class hoverButton extends StatefulWidget {
  String route;
  String text;
  String currentPage;
  hoverButton(this.route, this.text, this.currentPage);
  @override
  _hoverButtonState createState() =>
      _hoverButtonState(route, text, currentPage);
}

class _hoverButtonState extends State<hoverButton> {
  String route;
  String text;
  String currentPage;
  Color textColor = Colors.white;
  _hoverButtonState(this.route, this.text, this.currentPage);

  @override
  Widget build(BuildContext context) {
    return currentPage != text
        ? MouseRegion(
            onEnter: (_) {
              setState(() {
                textColor = Colors.yellowAccent;
              });
            },
            onExit: (_) {
              setState(() {
                textColor = Colors.white;
              });
            },
            child: FlatButton(
                child: Text(text,
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 20,
                        color: textColor,
                        fontFamily: "Longless")),
                onPressed: () {
                  Navigator.of(context).pushNamed(route);
                }),
          )
        : Container(
            child: FlatButton(
                child: Text(text,
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 20,
                        color: Colors.lightBlue,
                        fontFamily: "Longless")),
                onPressed: () {
                  Navigator.of(context).pushNamed(route);
                }),
          );
  }
}
// Container signContainer(){
//   return Container(
//     height:50,
//     constraints:BoxConstraints(
//         minWidth:200
//     ),
//     decoration:BoxDecoration(
//         color:Colors.white,
//         border:Border.all(width:3,color:Colors.black)
//     ),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           child: Image.network(
//             photo,
//             errorBuilder: (context, error,stack){
//               return Icon(
//                 Icons.account_circle,
//                 size: 40,
//                 color: Colors.grey,
//               );
//             },
//             width: 40.0,
//             height: 40.0,
//             fit: BoxFit.cover,
//           ),
//           decoration:BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(20.0)),
//           ),
//         ),
//         SizedBox(width:20),
//         Text(name == null?"Not Logged In":name,style: TextStyle(
//           color:Colors.black,
//           fontSize: 16,
//         ),),
//         Align(
//           alignment: Alignment.centerRight,
//           child: PopupMenuButton<Choice>(
//             icon: Icon(Icons.more_vert,color: Colors.black,),
//             onSelected: onItemMenuPress,
//             itemBuilder: (BuildContext context) {
//               return choices.map((Choice choice) {
//                 return PopupMenuItem<Choice>(
//                     value: choice,
//                     child: Row(
//                       children: <Widget>[
//                         Icon(
//                             choice.icon,
//                             color:Colors.black
//                         ),
//                         Container(
//                           width: 10.0,
//                         ),
//                         Text(
//                           choice.title,
//                           style: TextStyle(),
//                         ),
//                       ],
//                     ));
//               }).toList();
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }
