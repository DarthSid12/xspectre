import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

TextStyle style1 = TextStyle(
  color: Colors.red[600],
  fontSize: 26.0,
  fontWeight: FontWeight.bold
);
TextStyle style2 = TextStyle(
  color: Colors.white,
  fontSize: 26.0,
  fontWeight: FontWeight.bold
);
TextStyle style3 = TextStyle(
  color: Colors.white,
  fontSize: 100,
  fontWeight: FontWeight.bold,
  fontFamily: 'Schyler'
);
TextStyle style4 = TextStyle(
    color: Colors.red,
    fontFamily: "Longless",
    fontSize: 100,
);
TextStyle style5= TextStyle(
    color: Colors.white,
    fontFamily: "Longless",
    fontSize: 80,
);
TextStyle style6 = TextStyle(
    color:Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 28.0,
    fontStyle:FontStyle.italic
);
TextStyle NewsStyle = TextStyle(
  color: Colors.white,
  fontSize: 26,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic
);
TextStyle TermsHead =  TextStyle(
    color: Colors.red[800],
    fontFamily: "Longless",
    fontSize: 40,
    letterSpacing: 2,
    fontWeight: FontWeight.bold
);
TextStyle TermsDescription = TextStyle(
    color: Colors.black,
    fontFamily:"Impact",
    letterSpacing: 0.7,
    height: 1.3,
    fontSize: 20,
);
TextStyle addVideosInput = TextStyle(
    color:Colors.black,
    fontSize: 14,
    fontFamily:"Lulo",
    letterSpacing: 1.2,
    fontWeight: FontWeight.bold
);
TextStyle squadHead =  TextStyle(
    fontSize: 26,
    fontStyle: FontStyle.italic,
    color: Colors.white
);
TextStyle squadDescription = TextStyle(
    fontSize: 13,
    color: Colors.white
);
List<Widget> socials1 = [
    makeSocial(FontAwesomeIcons.facebook,"Facebook","https://www.facebook.com/xspectre.g"),
    makeSocial(FontAwesomeIcons.twitter,"Twitter","https://twitter.com/Xspectre14"),
    makeSocial(FontAwesomeIcons.youtube,"Youtube","https://www.youtube.com/channel/UCaKR6VQGvcyueWtHXKKnFBQ"),
    makeSocial(FontAwesomeIcons.instagram,"Instagram","https://www.instagram.com/xspectre.g/"),
    makeSocial(FontAwesomeIcons.reddit,"Reddit","https://www.reddit.com/user/xspectre_gaming"),
    makeSocial(FontAwesomeIcons.discord,"Discord","https://discord.gg/Sw9YwHdNcZ"),
];
GestureDetector makeSocial(var icon,String name,String link){
    return GestureDetector(
        onTap:(){
            html.window.open(link,"_blank");
        },
        child: Container(
            height:100,
            child:Column(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children:[
                    FaIcon(icon,
                        color:Colors.amber,
                        size:40),
                    Text(name,style:TextStyle(
                        color:Colors.white,
                        fontWeight:FontWeight.bold,
                        fontFamily:"Poppins",
                        fontSize:20
                    ))
                ]
            )
        ),
    );
}
enum Option { LogIn, SignUp }
Color kPrimaryColorDark = Colors.red[800];
