import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xspectre/AddVideos.dart';
import 'package:xspectre/Community.dart';
import 'package:xspectre/Home.dart';
import 'package:xspectre/JoinUs.dart';
import 'package:xspectre/Squad.dart';
import 'package:xspectre/T&C.dart';
import 'package:xspectre/Videos.dart';
import 'package:xspectre/help/IsPhone.dart';

// ignore: non_constant_identifier_names
Container Footer(context){
  List<Widget> subText1 = [
    widgetButtonGenerator("Join Us",(){Navigator.pushNamed(context,JoinUs.route);}),
    widgetButtonGenerator("Add Videos",(){Navigator.pushNamed(context,AddVideos.route);}),
    widgetButtonGenerator("T&C",(){Navigator.pushNamed(context,Terms.route);}),
    widgetButtonGenerator("Home",(){Navigator.pushNamed(context,Home.route);}),
    widgetButtonGenerator("Videos",(){Navigator.pushNamed(context,VideoPage.route);}),
    widgetButtonGenerator("Community",(){Navigator.pushNamed(context,Community.route);}),
  ];
  List<Widget> subText2 =[
    widgetButtonGenerator("Instagram",(){
      launch("https://www.instagram.com/xspectre.g/");
    }),
    widgetButtonGenerator("Discord",(){
      launch("https://discord.gg/Sw9YwHdNcZ");
    }),
    widgetButtonGenerator("Facebook",(){
      launch("https://www.facebook.com/xspectre.g");
    }),
    widgetButtonGenerator("Twitter",(){
      launch("https://twitter.com/Xspectre14");
    }),
    widgetButtonGenerator("Reddit",(){
      launch("https://twitter.com/Xspectre14");
    }),
  ];
  Container laptopFooter = Container(
    height:uniHeight(context)*0.4,
    width:uniWidth(context),
    color: Colors.black,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Explore", style: TextStyle(
              fontFamily: "Heading1",
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Colors.blue
            ),),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(Home.route);
              },
              child: Text("Home",style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
              ),),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(Community.route);
              },
              child: Text("Community",style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
              ),),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(VideoPage.route);
              },
              child: Text("Videos",style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
              ),),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(Squad.route);
              },
              child: Text("Squad",style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
              ),),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(JoinUs.route);
              },
              child: Text("Join Us",style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
              ),),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(Terms.route);
              },
              child: Text("T&C",style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
              ),),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(AddVideos.route);
              },
              child: Text("Add Videos",style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
              ),),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Socials", style: TextStyle(
                fontFamily: "Heading1",
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.blue
            ),),
            InkWell(
              onTap: (){
                launch("https://www.instagram.com/xspectre.g/");
              },
              child: Text("Instagram",style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
              ),),
            ),
            InkWell(
              onTap: (){
                launch("https://discord.gg/Sw9YwHdNcZ");
              },
              child: Text("Discord",style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
              ),),
            ),
            InkWell(
              onTap: (){
                launch("https://www.facebook.com/xspectre.g");
              },
              child: Text("Facebook",style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
              ),),
            ),
            InkWell(
              onTap: (){
                launch("https://twitter.com/Xspectre14");
              },
              child: Text("Twitter",style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
              ),),
            ),
        //     InkWell(
        //       onTap: (){
        //         Navigator.of(context).pushNamed(JoinUs.route);
        //       },
        //       child: Text("Join Us",style: TextStyle(
        //           fontSize: 18,
        //           color: Colors.white
        //       ),),
        //     ),
        //     InkWell(
        //       onTap: (){
        //         Navigator.of(context).pushNamed(Terms.route);
        //       },
        //       child: Text("T&C",style: TextStyle(
        //           fontSize: 18,
        //           color: Colors.white
        //       ),),
        //     ),
        //     InkWell(
        //       onTap: (){
        //         Navigator.of(context).pushNamed(AddVideos.route);
        //       },
        //       child: Text("Add Videos",style: TextStyle(
        //           fontSize: 18,
        //           color: Colors.white
        //       ),),
        //     ),
          ],
        ),
        // Column(),
      ],
    ),
  );
  Container footer = Container(
    color: Color.fromRGBO(29, 29, 29, 1),
    child:Column(
      children: [
        SizedBox(height:30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            infoBox("Explore",subText1 , context,extraWidget: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("X",style: TextStyle(
                        color: Colors.red,
                        fontFamily: "Longless",
                        fontSize: 70,
                      ),),
                      Text("spectre",style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Longless",
                        fontSize: 70,
                      ),),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Icon(Icons.copyright,size: 18,color: Colors.grey[400],),
                      Text("XSPECTRE Copyright 2021. All Rights Reserved",style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                      ),)
                    ],
                  )
                ],
              ),
            )),
            infoBox("Socials",subText2, context,extraWidget: Container()),
          ],
        ),
        SizedBox(height:70),
      ],
    )
  );
  Container mobileFooter = Container();
  return isLaptop(context)? footer:mobileFooter;
}
Container infoBox(String heading,List<Widget> clickables,BuildContext context,{Widget extraWidget}){
  double gapSize = 15;
  return Container(
    width: uniWidth(context)*0.3,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading,style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontFamily: "Longless"
        ),),
        SizedBox(height: gapSize,),
        Container(height: 1,width: uniWidth(context)*0.3,color: Colors.grey[800],),
        SizedBox(height: gapSize,),
        subTextListGen(clickables, context, gapSize),
        extraWidget == Container()?Container():SizedBox(height: 40,),
        extraWidget
      ],
    ),
  );
}

class widgetButtonGenerator extends StatefulWidget {
  Function function;
  String text;
  widgetButtonGenerator(this.text,this.function);
  @override
  _widgetButtonGeneratorState createState() => _widgetButtonGeneratorState(text,function);
}

class _widgetButtonGeneratorState extends State<widgetButtonGenerator> {
  Color textColor = Colors.white70;
  String text;
  Function function;

  _widgetButtonGeneratorState(this.text,this.function);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: MouseRegion(
        onEnter: (_){
          setState((){
            textColor = Colors.white;
          });
        },
        onExit: (_){
          setState((){
            textColor = Colors.white70;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          child: Text(text,style: TextStyle(
            fontSize: 12,
            color: textColor
          ),),
        ),
      ),
    );  }
}

Widget subTextListGen(List<Widget> subText,context,double gapSize){
  double count = subText.length%2 == 1?subText.length/2-0.5:subText.length/2;
  double increasingCount = 0;
  List<Widget> column1=[];
  List<Widget> column2=[];
  for (Widget text in subText){
    if (increasingCount == count){
      column2.add(text);
      column2.add(SizedBox(height: gapSize,));
    }
    else{
      column1.add(text);
      column1.add(SizedBox(height: gapSize,));
      increasingCount++;
    }
  }
  return Container(
    child: Stack(
      children:[
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: column2,
           ),
         ),
        Row(
          children: [
            SizedBox(width: uniWidth(context)*0.15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: column1,
            ),
          ],
        )
       ]
    ),
  );
}
