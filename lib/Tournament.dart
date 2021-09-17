import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';
import 'package:xspectre/help/Footer.dart';
import 'package:xspectre/help/IsPhone.dart';

import 'help/appBar.dart';

class Tournaments extends StatefulWidget {
  static const String route = '/tournament';
  @override
  _TournamentsState createState() => _TournamentsState();
}

class _TournamentsState extends State<Tournaments> {

  ScrollController _tournamentController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/TournamentBG.webp"),
            fit: BoxFit.cover
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SmoothScrollWeb(
          controller:_tournamentController,
          child: SingleChildScrollView(
            controller: _tournamentController,
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                appBar("Tournaments", context),
                SizedBox(height: 70,),
                Center(
                    child: Text("PREVIOUS TOURNAMENT",style: TextStyle(
                      fontSize: 50,
                      color: Colors.yellow,
                      fontFamily: "Nimble",
                      fontWeight: FontWeight.bold
                    ),)
                ),
                SizedBox(height: 70,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    secondAndThird("SECOND", "Dirk G",uniHeight(context)*0.5,),
                    SizedBox(width: 30,),
                    Container(
                      height: uniHeight(context)*0.75,
                      width: uniWidth(context)*0.27,
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 40,),
                          Text("FIRST",style: TextStyle(
                              color: Colors.red,
                              fontSize: 80,
                              fontFamily: "Nimble"
                          ),),
                          SizedBox(height:30),
                          Text("Bravery",style: TextStyle(
                              color: Colors.white,
                              fontSize: 100,
                              fontFamily: "Longless"
                          ),),
                        ],
                      ),
                    ),
                    SizedBox(width: 30,),
                    secondAndThird("THIRD", "Shya",uniHeight(context)*0.5,)
                  ],
                ),
                SizedBox(height:50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Container(
                        width: (uniWidth(context)*0.5)-30,
                        height: 700,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                            image: AssetImage("images/TournamentSidePic.webp"),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      Container(
                        width: (uniWidth(context)*0.5)-30,
                        height: 700,
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(height:40),
                            RichText(
                              text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                  fontFamily: "Lulo"
                              ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:"WHY PICK ",
                                  ),
                                  TextSpan(
                                    text:"X",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 55,
                                        fontFamily: "Lulo"
                                    ),
                                  ),
                                  TextSpan(
                                    text:"SPECTRE TOURNAMENTS?"
                                  )
                                ]
                            ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 30,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text("""The simple subtle way of knowing where you stand in this competitive battlefield of gaming is through our tournaments.\nThe tournaments are the best way for you to know how good you are at a particular competitive game.\n Participate in our tournaments to get to know other aspiring  gamers, esports enthusiasts and win big prizes. 
\nAll you gotta do is sign up, play, sweat hard and win

                              """, style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontSize:20
                              ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height:50),
                Footer(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget secondAndThird(String position,String name,double height){
    return Container(
      height: height,
      width: uniWidth(context)*0.27,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 40,),
          Text(position,style: TextStyle(
            color: Colors.red,
            fontSize: 50,
            fontFamily: "Nimble"
          ),),
          SizedBox(height:30),
          Text(name,style: TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontFamily: "Longless"
          ),),
        ],
      ),
    );
  }
}
