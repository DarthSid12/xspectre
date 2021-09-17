import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xspectre/JoinUs.dart';
import 'package:xspectre/T&C.dart';
import 'package:xspectre/Videos.dart';
import 'package:xspectre/help/appBar.dart';

import 'AddVideos.dart';
import 'Community.dart';
import 'Home.dart';
import 'Profile.dart';
import 'Styles.dart';
import 'help/IsPhone.dart';

class Squad extends StatefulWidget {
  static const String route = '/squad';
  @override
  _SquadState createState() => _SquadState();
}

class _SquadState extends State<Squad> {

  @override
  Widget build(BuildContext context) {
    List<Widget> middleWidgetList= isLaptop(context)? <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          make2Container("Abhimanyu Singhal", "CEO", "Head of Xspectre"),
          SizedBox(width:15),
          make2Container("Siddhanth Bhutani", "CFO", "Xspectre's Financial Head"),
        ],
      ),
      SizedBox(height:15),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          make2Container("Kinshuk Singh", "Co-founder", "Website Developer"),
          SizedBox(width:15),
          make2Container("Siddharth Agrawal", "CTO", "Website Developer"),
        ],
      ),
      SizedBox(height: 30,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          make1Container("Mehul Gupta", "AM"),
          SizedBox(width:15),
          make1Container("Ashutosh Sharma", "Head of graphics and design"),
        ],
      ),
      SizedBox(height:30),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          make2Container("Ishaan Dar", "Head of Public", "Relations"),
          SizedBox(width:15),
          make2Container("Himanshu Garg", "Head of Public", "Relations"),
          SizedBox(width:15),
          make2Container("Yajur Raheja", "Senior Director", "Public Relations"),
        ],
      ),
    ]:<Widget>[
      make2Container("Abhimanyu Singhal", "CEO", "Head of Xspectre"),
      SizedBox(height:15),
      make2Container("Siddhanth Bhutani", "CEO", "Xspectre's Financial Head"),
      SizedBox(height:15),
      make2Container("Kinshuk Singh", "Co-founder", "Website Developer"),
      SizedBox(height:15),
      make2Container("Siddharth Agrawal", "Co-founder", "Website Developer"),
      SizedBox(height:15),
      make1Container("Mehul Gupta", "AM"),
      SizedBox(height:15),
      make1Container("Ashutosh Sharma", "Head of graphics and design"),
      SizedBox(height:15),
      make2Container("Ishaan Dar", "Head of Public", "Relations"),
      SizedBox(height:15),
      make2Container("Himanshu Garg", "Head of Public", "Relations"),
      SizedBox(height:15),
      make2Container("Yajur Raheja", "Senior Director", "Public Relations"),
    ];
    return Scaffold(
      extendBodyBehindAppBar:true,

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
                        Navigator.of(context).pushNamed(Home.route);
                      },
                    ),
                    ListTile(
                        leading: Icon(Icons.filter),
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
                    Container(
                      color: Colors.grey[400],
                      child: ListTile(
                          leading: Icon(Icons.people),
                          title: Text("Squad"),
                          onTap: () {
                            Navigator.of(context).pushNamed(Squad.route);
                          }),
                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.headset),
                      title: Text("Join Us"),
                      onTap: () {
                         Navigator.of(context).pushNamed(JoinUs.route);
                      },
                    ),
                    ListTile(
                      leading:FaIcon(FontAwesomeIcons.scroll) ,
                      title: Text("T&C"),
                      onTap: () {
                        Navigator.of(context).pushNamed(Terms.route);
                      },
                    ),

                    ListTile(
                      leading: Icon(Icons.add),
                      title: Text("Add Videos"),
                      onTap: () {
                        Navigator.of(context).pushNamed(AddVideos.route);
                      },
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
              image: DecorationImage(fit:BoxFit.cover,image: NetworkImage("https://i.pinimg.com/originals/87/7c/c3/877cc368116f3acb5993d70513a115a5.png"))
          ),
        child: SingleChildScrollView(
          child:Column(
            children: <Widget>[
             appBar("Squad", context),
              SizedBox(height:20),
              Text("Our Team",style: TextStyle(
                color:Colors.amber,
                fontFamily: "Peaches",
                fontSize: 112,
              ),),
              SizedBox(height:50),
              ] +
            middleWidgetList
                +
             <Widget> [
              //
              // SizedBox(height:30),
              // Text("Who are We?",style: TextStyle(
              //   color:Colors.white,
              //   fontFamily: "Peaches",
              //   fontSize: 112,
              // ),),
              // SizedBox(height: 30,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Stack(
              //       children: [
              //         Container(
              //           height: 560,
              //           width: 800,
              //           decoration: BoxDecoration(
              //                borderRadius: BorderRadius.all(Radius.circular(18)),
              //               image: DecorationImage(fit:BoxFit.cover,image: NetworkImage("http://trumpwallpapers.com/wp-content/uploads/Fortnite-Wallpaper-06-2880-x-1800.png"))
              //           ),
              //         ),
              //         Container(
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.all(Radius.circular(18)),
              //             color: Colors.black,
              //           ),
              //           height: 560,
              //           width: 585,
              //           child: Text("We’re the XSPECTRE and we are new to the world of gaming and bring to you something mind-blowing.\n We believe in creating, helping and promoting each and every single pro-gamer or a wanna-be gamer and have taken a step further into the boundless universe of gamers and also helping people who are even remotely related to gaming.\nWe specialize in working directly with gamers and our content creators to create sustainable partnerships and provide our users with the best content and experience.\n We started this website because we were tired of having to create multiple accounts across multiple websites, shifting through these websites and having to search for the rightly helpful content and the fulfilling experience and we believed there was a better way.",
              //             style: TextStyle(
              //               fontFamily: "PoppinsThin",
              //               color: Colors.white,
              //               fontSize: 22,
              //           ),),
              //         )
              //       ],
              //     ),
              //   ],
              // ),
              // SizedBox(height:30),
              // Text("How we Work?",style: TextStyle(
              //   color:Colors.white,
              //   fontFamily: "Peaches",
              //   fontSize: 112,
              // ),),
              // SizedBox(height:30),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       height: 580,
              //       width: 400,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.all(Radius.circular(18)),
              //           image: DecorationImage(fit:BoxFit.cover,image: NetworkImage("https://i.pinimg.com/736x/8f/1a/b9/8f1ab9ed21e394e9db7c44c4200e78e3.jpg"))
              //       ),
              //     ),
              //     Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.all(Radius.circular(18)),
              //         color: Colors.black,
              //       ),
              //       height: 580,
              //       width: 500,
              //       child: Text("The way in which we work is solely dependent on the relationship that we have and maintain with our fellow creators.\n We help you grow through our socials and through the people we gather working directly alongside them by giving them recognition individually as well as a community.Promotion done on your website is a deal contingent that our creator in return promotes us on all and if not all some of his/her social media and we do the same for them providing regular updates.\nThe main emphasis that we lay on is on the user experience and the interaction based aspects because that is what helps us to grow further",
              //         style: TextStyle(
              //           fontFamily: "PoppinsThin",
              //           color: Colors.white,
              //           fontSize: 22,
              //         ),),
              //     ),
              //   ],
              // ),
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

        ),
      ),
    );
  }
  Container make2Container(String name,String desc1,String desc2){
    return Container(
        height:250,
        width:isLaptop(context)?300:uniWidth(context)*0.92,
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.red,width: 6),
            borderRadius: BorderRadius.circular(10)
        ),
        child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ Text(name,style: squadHead),
              SizedBox(height:20),
              Text(desc1,style: squadDescription),
              Text(desc2,style: squadDescription),
            ]
        )
    );
  }
  Container make1Container(String name,String desc1){
    return Container(
        height:250,
        width:isLaptop(context)?300:uniWidth(context)*0.92,
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.red,width: 6),
            borderRadius: BorderRadius.circular(10)
        ),
        child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ Text(name,style: squadHead),
              SizedBox(height:20),
              Text(desc1,style: squadDescription),
            ]
        )
    );
  }
}
