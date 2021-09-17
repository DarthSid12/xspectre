import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:html' as html;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';
import 'package:webscrollbar/webscrollbar.dart';
import 'package:xspectre/AddVideos.dart';
import 'package:xspectre/Login/Login.dart';
import 'package:xspectre/Styles.dart';
import 'package:xspectre/help/appBar.dart';
import 'package:xspectre/help/complexNews.dart';

import 'Community.dart';
import 'JoinUs.dart';
import 'help/Auth.dart';
import 'Profile.dart';
import 'Squad.dart';
import 'T&C.dart';
import 'Videos.dart';
import 'help/Footer.dart';
import 'help/HTMLelement.dart';
import 'help/IsPhone.dart';

class Home extends StatefulWidget {
  static const String route = '/';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool variable = true;
  String name = "";
  String photo = "";
  List<Widget> videoWidgetList = [];
  CarouselController carouselController = CarouselController();
  CarouselController carouselController2 = CarouselController();
  ScrollController scrollController = ScrollController();
  IFrameElement iFrameH = IFrameElement();
  SharedPreferences homePrefs;
  ScrollController _homeScrollController = ScrollController();
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -15, 0);
  int _current = 0;
  double _offset = 0;
  List<Choice> choices = [];
  List<Widget> imgList;
  List<Widget> imgList2;
  String news1 =
      'Follow us on our social pages for the latest news and developments in the gaming world';
  String news2 =
      'Find videos of your favourite games and content creators using the all new filter feature in the videos page';
  String news3 =
      'Challenge your favourite content creators to a battle of your choice using the all new challenge feature';

  String home1 =
      "We’re the XSPECTRE and we are new to the world of gaming and bring to you something mind-blowing. We believe in creating, helping and promoting each and every single pro-gamer or a wanna-be gamer and have taken a step further into the boundless universe of gamers and also helping people who are even remotely related to gaming.";
  String home2 =
      "We help new and upcoming gaming content creators by providing them with a bigger audience, organizing events like tournaments and connecting them with their audience through a new and innovative way ";
  String home3 =
      "The way in which we work is solely dependent on the relationship that we have and maintain with our fellow creators. We help you grow through our socials and through the people we gather working directly alongside them by giving them recognition individually as well as a community.Promotion done on your website is a deal contingent that our creator in return promotes us on all and if not all some of his/her social media and we do the same for them providing regular updates.";
  // Container htmlContainer1 =  HTMLElement('''
  //             <div>
  //            <p>Hello</p>
  //             </div>
  //             ''',"HFIHIdih",100,300,);
  List<Widget> middleNavList = [
    makeImageContainer(
        "images/OurCreators.webp",
        "All our creators",
        "Xspectre's\ncreators",
        "Follow all our content creators on their socials and challenge them to your favourite games",
        "",
        Community.route),
    SizedBox(width: 0, height: 20),
    makeImageContainer(
        "images/OurTeam.webp",
        "Our team",
        "Xspectre's\nteam",
        "Check out the people who work hard to provide you with the ultimate experience and the best content",
        "",
        Squad.route),
    SizedBox(width: 0, height: 20),
    makeImageContainer(
        "images/OurVideos.webp",
        "Our videos",
        "Xspectre's\nvideos",
        "Watch the best clips of your favourite content creators and games all at one place",
        "",
        VideoPage.route)
  ];
  @override
  void initState() {
    super.initState();
    makeVWidgetList();
    setData();
    choices = <Choice>[
      const Choice(title: 'Profile', icon: Icons.account_circle),
      const Choice(title: "Log in", icon: Icons.exit_to_app),
    ];
  }

  @override
  Widget build(BuildContext context) {
    iFrameH.width = (MediaQuery.of(context).size.width).toString();
    iFrameH.height = (MediaQuery.of(context).size.height * 0.95).toString();
    imgList = [
      makeNewsContainer("images/SocialMediaBG.webp", "Social Media", news1),
      makeNewsContainer("images/VideosNewsBG.webp", "Videos", news2),
      makeNewsContainer("images/ChallengesNewsBG.webp", "Challenges", news3)
    ];
    imgList2 = [
      makeNewsContainer("images/Fortnite.webp", "Who we are", home1),
      makeNewsContainer("images/Valorant.webp", "What we do", home2),
      makeNewsContainer("images/CallOfDuty.webp", "How we work", home3)
    ];

    iFrameH.src =
        'https://www.youtube.com/embed/wm8_BdXOE8E?rel=0&amp;controls=0&autoplay=1&amp;loop=1&amp;disablekb=1&amp;fs=0&amp;modestbranding=1&amp;';
    iFrameH.allowFullscreen = true;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      drawer: Container(
          width: MediaQuery.of(context).size.width * 0.5, //20.0,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            Container(
              color: Colors.grey[400],
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
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
                }),
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
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.scroll),
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
          ]))),
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              // color:Colors.white
              image: DecorationImage(
                  image: AssetImage("images/HomeBG.webp"),
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.repeat),
            ),
            child: SmoothScrollWeb(
              scrollSpeed: 130,
              controller: _homeScrollController,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                controller: _homeScrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // AppBar(
                    //   toolbarHeight: 70,
                    //   backgroundColor: Colors.black,
                    //   elevation: 0,
                    //   title: Image.asset("images/XspectreLogo.png"),
                    //   leading:isLaptop(context)?Container():Builder(
                    //     builder:(context) => IconButton(
                    //         icon: Icon(Icons.menu),
                    //         onPressed: (){
                    //           Scaffold.of(context).openDrawer();
                    //         }
                    //     ),
                    //   ),
                    //   actions: !isLaptop(context)?<Widget>[
                    //     signContainer(),
                    //     SizedBox(width:20)
                    //   ]:<Widget>[
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: [
                    //         FlatButton(
                    //           onPressed:(){},
                    //           child:Text("Home", style:TextStyle(
                    //               fontSize:16,
                    //               color:Colors.lightBlue
                    //           )),
                    //         ),
                    //         hoverButton(VideoPage.route,"Videos"),
                    //         FlatButton(
                    //             child:Text("Community", style:TextStyle(
                    //                 letterSpacing:3,
                    //                 fontSize:12,
                    //                 color:Colors.white
                    //             )),
                    //             onPressed: () {
                    //               Navigator.of(context).pushNamed(Community.route);
                    //             }
                    //         ),FlatButton(
                    //             child:Text("About Us", style:TextStyle(
                    //                 letterSpacing:3,
                    //                 fontSize:12,
                    //                 color:Colors.white
                    //             )),
                    //             onPressed: () {
                    //               Navigator.of(context).pushNamed(Squad.route);
                    //             }
                    //         ),FlatButton(
                    //             child:Text("Join Us", style:TextStyle(
                    //                 letterSpacing:3,
                    //                 fontSize:12,
                    //                 color:Colors.white
                    //             )),
                    //             onPressed: () {
                    //               Navigator.of(context).pushNamed(JoinUs.route);
                    //             }
                    //         ),FlatButton(
                    //             child:Text("Add Videos", style:TextStyle(
                    //                 letterSpacing:3,
                    //                 fontSize:12,
                    //                 color:Colors.white
                    //             )),
                    //             onPressed: () {
                    //               Navigator.of(context).pushNamed(AddVideos.route);
                    //             }
                    //         ),FlatButton(
                    //             child:Text("T&C", style:TextStyle(
                    //                 letterSpacing:3,
                    //                 fontSize:12,
                    //                 color:Colors.white
                    //             )),
                    //             onPressed: () {
                    //               Navigator.of(context).pushNamed(Terms.route);
                    //             }
                    //         ),
                    //         SizedBox(width:20)
                    //       ],
                    //     ),
                    //     signContainer(),
                    //     SizedBox(width:40)
                    //
                    //   ],
                    // ),
                    appBar("Home", context),
                    //THIS IS FOR VIDEO
                    // Container(
                    //   height:MediaQuery.of(context).size.height*0.9,
                    //   width:MediaQuery.of(context).size.width,
                    //      child:  HtmlElementView(
                    //          key:UniqueKey(),
                    //          viewType:'i'
                    //      )
                    // ),
                    //THIS IS FOR SLIDER
                    Builder(
                      builder: (context) {
                        final double height =
                            MediaQuery.of(context).size.height;
                        return CarouselSlider(
                          options: CarouselOptions(
                            height: height,
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                            autoPlay: true,
                          ),
                          items: imgList2
                              .map((item) => Container(child: item))
                              .toList(),
                        );
                      },
                    ),
                    // htmlContainer1,
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RotateAnimatedTextKit(
                          onTap: () {},
                          text: [
                            "We're the team of Xspectre".toUpperCase(),
                            "And we bring to you something new".toUpperCase(),
                            "Something amazing".toUpperCase(),
                            "Something you have never seen before".toUpperCase()
                          ],
                          repeatForever: true,
                          duration: Duration(seconds: 4),
                          textStyle: TextStyle(
                            fontSize: isLaptop(context) ? 100.0 : 54.0,
                            fontFamily: "Longless",
                            color: Colors.red[600],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 40),
                    // Row(
                    //   mainAxisAlignment:MainAxisAlignment.center,
                    //   children: [
                    //     GestureDetector(
                    //       onTap:(){
                    //         setState((){
                    //           variable = !variable;
                    //         });
                    //       },
                    //       child: MouseRegion(
                    //           onHover: (event) {
                    //             setState(() {
                    //               variable = false;
                    //             });
                    //           },
                    //           onExit: (event) {
                    //             setState(() {
                    //               variable = true;
                    //             });
                    //           },
                    //           child: AnimatedCrossFade(
                    //             crossFadeState:variable?CrossFadeState.showFirst:CrossFadeState.showSecond,
                    //             duration:Duration(seconds:1),
                    //             firstChild:  Container(
                    //               decoration:BoxDecoration(
                    //                 image:DecorationImage(
                    //                   image:NetworkImage("https://live.staticflickr.com/4890/31598014047_d850f103a2_k.jpg"),
                    //                   fit:BoxFit.cover
                    //                 ),
                    //               ),
                    //               height:MediaQuery.of(context).size.height*0.9,
                    //               width: MediaQuery.of(context).size.width>480?MediaQuery.of(context).size.width *0.31:MediaQuery.of(context).size.width*0.8,
                    //               child: Column(
                    //                 children: <Widget>[
                    //                   SizedBox(height: 70,),
                    //                   Row(
                    //                     children: [
                    //                       SizedBox(width:40),
                    //                       Container(
                    //                         height: 2,
                    //                         color: Colors.black,),
                    //                     ],
                    //                   ),
                    //                   SizedBox(height: 20,),
                    //                   Row(
                    //                     children: <Widget>[
                    //                       SizedBox(width: 50),
                    //                       Text("ABOUT",style: TextStyle(
                    //                           letterSpacing: 5,
                    //                           color: Colors.black,
                    //                           fontWeight: FontWeight.bold,
                    //                           fontSize: 36
                    //                       ),),
                    //                     ],
                    //                   ),
                    //                   SizedBox(height: 20,),
                    //                   Row(
                    //                     children: [
                    //                       SizedBox(width: MediaQuery.of(context).size.width*0.07,),
                    //                       Text("X",style: style4,),
                    //                       Text("SPECTRE",style:TextStyle(
                    //                           letterSpacing: 5,
                    //                           color: Colors.black,
                    //                           fontWeight: FontWeight.bold,
                    //                           fontSize: 36
                    //                       ) ,)
                    //                     ],
                    //                   )
                    //                 ],
                    //               ),
                    //             ),
                    //             secondChild: Container(
                    //               height:MediaQuery.of(context).size.height*0.9,
                    //               width: isLaptop(context)?MediaQuery.of(context).size.width *0.31:MediaQuery.of(context).size.width*0.8,
                    //               color: Colors.white,
                    //               child: Padding(
                    //                 padding: EdgeInsets.all(7),
                    //                 child: Container(
                    //                   color: Colors.black,
                    //                   child: Text("We’re the XSPECTRE and we are new to the world of gaming and bring to you something mind-blowing. We believe in creating, helping and promoting each and every single pro-gamer or a wanna-be gamer and have taken a step further into the boundless universe of gamers and also helping people who are even remotely related to gaming....."
                    //                     ,maxLines: null,
                    //                     style: TextStyle(
                    //                         color: Colors.amber,
                    //                         fontSize: 26,
                    //                         fontStyle: FontStyle.italic,
                    //                         fontWeight: FontWeight.bold
                    //                     ),),
                    //                 ),
                    //
                    //               ),
                    //             ),
                    //           )
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height:34),
                    MediaQuery.of(context).size.width > 480
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Xperience', style: style3),
                              SizedBox(
                                width: 10,
                              ),
                              Text('X', style: style4),
                              Text('spectre', style: style5)
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                Text('Xperience', style: style3),
                              ]),
                    MediaQuery.of(context).size.width > 480
                        ? Container()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                Text('X', style: style4),
                                Text('spectre', style: style5)
                              ]),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    isLaptop(context)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: middleNavList)
                        : Column(children: middleNavList),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Text(
                      "Top Videos",
                      style: style3,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    // isLaptop(context)? Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Column(
                    //       children: <Widget>[
                    //         SizedBox(height: MediaQuery
                    //             .of(context)
                    //             .size
                    //             .height * 0.03),
                    //        makeLaptopExpandableImage("https://s3.amazonaws.com/pbblogassets/uploads/2019/08/06130054/gaming-music-inline.jpg"),
                    //         Container(
                    //           color: Colors.white,
                    //           width: MediaQuery
                    //               .of(context)
                    //               .size
                    //               .width * 0.28,
                    //           height: MediaQuery
                    //               .of(context)
                    //               .size
                    //               .height * 0.6,
                    //           child: Column(
                    //             children: [
                    //               Text("VIDEOS", style: TextStyle(
                    //                 letterSpacing: 5,
                    //                 color: Colors.grey,
                    //               )),
                    //               Text(
                    //                 "Watch the best clips of your favourite content creators and games all at one place"
                    //                 , style: style6
                    //                 , maxLines: null,),
                    //               FlatButton(
                    //                 onPressed: () {
                    //                   Navigator.pushReplacement(context, MaterialPageRoute(
                    //                       builder: (context) => VideoPage()),
                    //                   );
                    //                 },
                    //                 child: Text("Have a look", style: TextStyle(
                    //                     color: Colors.white
                    //                 )),
                    //                 color: Colors.grey[800],
                    //               )
                    //             ],
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //     SizedBox(width: MediaQuery
                    //         .of(context)
                    //         .size
                    //         .width * 0.016),
                    //     Column(
                    //       children: <Widget>[
                    //         SizedBox(height: MediaQuery
                    //             .of(context)
                    //             .size
                    //             .height * 0.03),
                    //         makeLaptopExpandableImage("https://screenanigans.files.wordpress.com/2018/06/minecraft-video-gaming-youtube.jpg"),
                    //         Container(
                    //           color: Colors.white,
                    //           width: MediaQuery
                    //               .of(context)
                    //               .size
                    //               .width * 0.28,
                    //           height: MediaQuery
                    //               .of(context)
                    //               .size
                    //               .height * 0.6,
                    //           child: Column(
                    //             children: [
                    //               Text("CHALLENGES", style: TextStyle(
                    //                 letterSpacing: 5,
                    //                 color: Colors.grey,
                    //               )),
                    //               Text(
                    //                 "Challenge our content creators to your favourite games and get featured on our website if you win",
                    //                 style: style6
                    //                 , maxLines: null,),
                    //               SizedBox(height: MediaQuery
                    //                   .of(context)
                    //                   .size
                    //                   .height * 0.06),
                    //               FlatButton(
                    //                 onPressed: () {
                    //                   Navigator.pushReplacement(context, MaterialPageRoute(
                    //                       builder: (context) => Community()),
                    //                   );
                    //                 },
                    //                 child: Text("Have a look", style: TextStyle(
                    //                     color: Colors.white
                    //                 )),
                    //                 color: Colors.grey[800],
                    //               )
                    //             ],
                    //           ),
                    //         )
                    //       ],
                    //     )
                    //   ],
                    // ) : Container(
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: <Widget>[
                    //       Column(
                    //         children: <Widget>[
                    //           SizedBox(height: MediaQuery
                    //               .of(context)
                    //               .size
                    //               .height * 0.03),
                    //           Container(
                    //             height: MediaQuery
                    //                 .of(context)
                    //                 .size
                    //                 .height * 0.5,
                    //             width: MediaQuery
                    //                 .of(context)
                    //                 .size
                    //                 .width * 0.8,
                    //             child: Image(
                    //               fit: BoxFit.cover,
                    //               image:NetworkImage(
                    //                   "https://s3.amazonaws.com/pbblogassets/uploads/2019/08/06130054/gaming-music-inline.jpg"
                    //               ),
                    //             ),
                    //           ),
                    //           Container(
                    //             color: Colors.white,
                    //             width: MediaQuery
                    //                 .of(context)
                    //                 .size
                    //                 .width * 0.8,
                    //             height: MediaQuery
                    //                 .of(context)
                    //                 .size
                    //                 .height * 0.5,
                    //             child: Column(
                    //               children: [
                    //                 Text("VIDEOS", style: TextStyle(
                    //                   letterSpacing: 5,
                    //                   color: Colors.grey,
                    //                 )),
                    //                 Row(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   children: [
                    //                     Container(
                    //                       width: MediaQuery
                    //                           .of(context)
                    //                           .size
                    //                           .width * 0.8 - 80,
                    //                       child: Text(
                    //                         "Watch the best clips of your favourite content creators and games all at one place"
                    //                         , style: style6
                    //                         , maxLines: null,),
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 FlatButton(
                    //                   onPressed: () {
                    //                     Navigator.pushReplacement(context, MaterialPageRoute(
                    //                         builder: (context) => VideoPage()),
                    //                     );
                    //                   },
                    //
                    //                   child: Text("Have a look", style: TextStyle(
                    //                       color: Colors.white
                    //                   )),
                    //                   color: Colors.grey[800],
                    //                 )
                    //               ],
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //       SizedBox(height: MediaQuery
                    //           .of(context)
                    //           .size
                    //           .height * 0.04),
                    //       Column(
                    //         children: <Widget>[
                    //           Container(
                    //             height: MediaQuery
                    //                 .of(context)
                    //                 .size
                    //                 .height * 0.5,
                    //             width: MediaQuery
                    //                 .of(context)
                    //                 .size
                    //                 .width * 0.8,
                    //             child: Image(
                    //               fit: BoxFit.cover,
                    //               image: NetworkImage(
                    //                   "https://screenanigans.files.wordpress.com/2018/06/minecraft-video-gaming-youtube.jpg"
                    //               ),
                    //             ),
                    //           ),
                    //           Container(
                    //             color: Colors.white,
                    //             width: MediaQuery
                    //                 .of(context)
                    //                 .size
                    //                 .width * 0.8,
                    //             height: MediaQuery
                    //                 .of(context)
                    //                 .size
                    //                 .height * 0.5,
                    //             child: Column(
                    //               children: [
                    //                 Text("CHALLENGES", style: TextStyle(
                    //                   letterSpacing: 5,
                    //                   color: Colors.grey,
                    //                 )),
                    //                 Text(
                    //                   "Challenge our content creators to your favourite games and get featured on our website if you win",
                    //                   style: style6
                    //                   , maxLines: null,),
                    //                 SizedBox(height: MediaQuery
                    //                     .of(context)
                    //                     .size
                    //                     .height * 0.06),
                    //                 FlatButton(
                    //                   onPressed: () {
                    //                     Navigator.pushReplacement(context, MaterialPageRoute(
                    //                         builder: (context) => Community()),
                    //                     );
                    //                   },
                    //                   child: Text("Have a look", style: TextStyle(
                    //                       color: Colors.white
                    //                   )),
                    //                   color: Colors.grey[800],
                    //                 )
                    //               ],
                    //             ),
                    //           )
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: MediaQuery
                    //     .of(context)
                    //     .size
                    //     .height * 0.03),
                    // isLaptop(context)? Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Column(
                    //       children: <Widget>[
                    //         SizedBox(height: MediaQuery
                    //             .of(context)
                    //             .size
                    //             .height * 0.03),
                    //         Container(
                    //           height: MediaQuery
                    //               .of(context)
                    //               .size
                    //               .height * 0.45,
                    //           width: MediaQuery
                    //               .of(context)
                    //               .size
                    //               .width * 0.28,
                    //           child: Image(
                    //             fit: BoxFit.cover,
                    //             image: AssetImage(
                    //                 "images/HeadPhonesBlog.jpg"
                    //             ),
                    //           ),
                    //         ),
                    //         Container(
                    //           color: Colors.white,
                    //           width: MediaQuery
                    //               .of(context)
                    //               .size
                    //               .width * 0.28,
                    //           height: MediaQuery
                    //               .of(context)
                    //               .size
                    //               .height * 0.6,
                    //           child: Column(
                    //             children: [
                    //               Text("BLOGS", style: TextStyle(
                    //                 letterSpacing: 5,
                    //                 color: Colors.grey,
                    //               )),
                    //               Text(
                    //                 "Collect facts and learn about the deepest and the most informative stuff about gaming  through our bloggers' best pieces"
                    //                 , style: style6
                    //                 , maxLines: null,),
                    //               FlatButton(
                    //                 onPressed: () {},
                    //                 child: Text("Have a look", style: TextStyle(
                    //                     color: Colors.white
                    //                 )),
                    //                 color: Colors.grey[800],
                    //               )
                    //             ],
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //     SizedBox(width: MediaQuery
                    //         .of(context)
                    //         .size
                    //         .width * 0.016),
                    //     Column(
                    //       children: <Widget>[
                    //         Container(
                    //           height: MediaQuery
                    //               .of(context)
                    //               .size
                    //               .height * 0.45,
                    //           width: MediaQuery
                    //               .of(context)
                    //               .size
                    //               .width * 0.28,
                    //           child: Image(
                    //             fit: BoxFit.cover,
                    //             image: AssetImage(
                    //                 "images/ControllerReviews.jpg"
                    //             ),
                    //           ),
                    //         ),
                    //         Container(
                    //           color: Colors.white,
                    //           width: MediaQuery
                    //               .of(context)
                    //               .size
                    //               .width * 0.28,
                    //           height: MediaQuery
                    //               .of(context)
                    //               .size
                    //               .height * 0.6,
                    //           child: Column(
                    //             children: [
                    //               Text("REVIEWS", style: TextStyle(
                    //                 letterSpacing: 5,
                    //                 color: Colors.grey,
                    //               )),
                    //               Text(
                    //                 "Reviews from the best which make sure that you get the best content/products",
                    //                 style: style6
                    //                 , maxLines: null,),
                    //               SizedBox(height: MediaQuery
                    //                   .of(context)
                    //                   .size
                    //                   .height * 0.06),
                    //               FlatButton(
                    //                 onPressed: () {},
                    //                 child: Text("Have a look", style: TextStyle(
                    //                     color: Colors.white
                    //                 )),
                    //                 color: Colors.grey[800],
                    //               )
                    //             ],
                    //           ),
                    //         )
                    //       ],
                    //     )
                    //   ],
                    // ) : Container(
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: <Widget>[
                    //       Column(
                    //         children: <Widget>[
                    //           SizedBox(height: MediaQuery
                    //               .of(context)
                    //               .size
                    //               .height * 0.03),
                    //           Container(
                    //             height: MediaQuery
                    //                 .of(context)
                    //                 .size
                    //                 .height * 0.5,
                    //             width: MediaQuery
                    //                 .of(context)
                    //                 .size
                    //                 .width * 0.8,
                    //             child: Image(
                    //               fit: BoxFit.cover,
                    //               image: AssetImage(
                    //                   "images/HeadPhonesBlog.jpg"
                    //               ),
                    //             ),
                    //           ),
                    //           Container(
                    //             color: Colors.white,
                    //             width: MediaQuery
                    //                 .of(context)
                    //                 .size
                    //                 .width * 0.8,
                    //             height: MediaQuery
                    //                 .of(context)
                    //                 .size
                    //                 .height * 0.5,
                    //             child: Column(
                    //               children: [
                    //                 Text("BLOGS", style: TextStyle(
                    //                   letterSpacing: 5,
                    //                   color: Colors.grey,
                    //                 )),
                    //                 Row(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   children: [
                    //                     Container(
                    //                       width: MediaQuery
                    //                           .of(context)
                    //                           .size
                    //                           .width * 0.8 - 80,
                    //                       child: Text(
                    //                         "Collect facts and learn about the deepest and the most informative stuff about gaming  through our bloggers' best pieces"
                    //                         , style: style6
                    //                         , maxLines: null,),
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 FlatButton(
                    //                   onPressed: () {},
                    //
                    //                   child: Text("Have a look", style: TextStyle(
                    //                       color: Colors.white
                    //                   )),
                    //                   color: Colors.grey[800],
                    //                 )
                    //               ],
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //       SizedBox(height: MediaQuery
                    //           .of(context)
                    //           .size
                    //           .height * 0.04),
                    //       Column(
                    //         children: <Widget>[
                    //           Container(
                    //             height: MediaQuery
                    //                 .of(context)
                    //                 .size
                    //                 .height * 0.5,
                    //             width: MediaQuery
                    //                 .of(context)
                    //                 .size
                    //                 .width * 0.8,
                    //             child: Image(
                    //               fit: BoxFit.cover,
                    //               image: AssetImage(
                    //                   "images/ControllerReviews.jpg"
                    //               ),
                    //             ),
                    //           ),
                    //           Container(
                    //             color: Colors.white,
                    //             width: MediaQuery
                    //                 .of(context)
                    //                 .size
                    //                 .width * 0.8,
                    //             height: MediaQuery
                    //                 .of(context)
                    //                 .size
                    //                 .height * 0.5,
                    //             child: Column(
                    //               children: [
                    //                 Text("REVIEWS", style: TextStyle(
                    //                   letterSpacing: 5,
                    //                   color: Colors.grey,
                    //                 )),
                    //                 Text(
                    //                   "Best in class reviews which make sure that you get the best content/products",
                    //                   style: style6
                    //                   , maxLines: null,),
                    //                 SizedBox(height: MediaQuery
                    //                     .of(context)
                    //                     .size
                    //                     .height * 0.06),
                    //                 FlatButton(
                    //                   onPressed: () {},
                    //                   child: Text("Have a look", style: TextStyle(
                    //                       color: Colors.white
                    //                   )),
                    //                   color: Colors.grey[800],
                    //                 )
                    //               ],
                    //             ),
                    //           )
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: MediaQuery
                    //     .of(context)
                    //     .size
                    //     .height * 0.09,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: videoWidgetList,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    // Container(
                    //   color: Colors.black,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Column(
                    //       children: [
                    //         Text('LATEST NEWS', style: TextStyle(
                    //             letterSpacing: 5.0,
                    //             color: Colors.pink[200],
                    //             fontSize: 30,
                    //             fontWeight: FontWeight.bold
                    //         ),),
                    //         SizedBox(height: MediaQuery
                    //             .of(context)
                    //             .size
                    //             .height * 0.03),
                    //         MediaQuery
                    //             .of(context)
                    //             .size
                    //             .width > 480 ? Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           children: <Widget>[
                    //
                    //             SizedBox(height: MediaQuery
                    //                 .of(context)
                    //                 .size
                    //                 .height * 0.03),
                    //             Stack(
                    //               children: [
                    //
                    //                 Container(
                    //                   decoration: BoxDecoration(
                    //                       image: DecorationImage(
                    //                           fit: BoxFit.cover,
                    //                           image: AssetImage(
                    //                               'images/Game1.PNG'
                    //                           )
                    //                       )
                    //                   ),
                    //                   height: MediaQuery
                    //                       .of(context)
                    //                       .size
                    //                       .height * 0.75,
                    //                   width: MediaQuery
                    //                       .of(context)
                    //                       .size
                    //                       .width * 0.24,
                    //                   child: Center(
                    //                     child: Row(
                    //                       children: [
                    //                         SizedBox(width: 40),
                    //                         Container(
                    //                             width: MediaQuery
                    //                                 .of(context)
                    //                                 .size
                    //                                 .width * 0.24 - 80,
                    //                             child: Text(news1, style: NewsStyle,
                    //                                 maxLines: null)),
                    //                         SizedBox(width: 40)
                    //
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //             Stack(
                    //               children: [
                    //                 Container(
                    //                   decoration: BoxDecoration(
                    //                       image: DecorationImage(
                    //                           fit: BoxFit.cover,
                    //                           image: AssetImage(
                    //                               'images/Game2.PNG'
                    //                           )
                    //                       )
                    //                   ),
                    //                   height: MediaQuery
                    //                       .of(context)
                    //                       .size
                    //                       .height * 0.75,
                    //                   width: MediaQuery
                    //                       .of(context)
                    //                       .size
                    //                       .width * 0.24,
                    //                   child: Center(
                    //                     child: Row(
                    //                       children: [
                    //                         SizedBox(width: 40),
                    //                         Container(
                    //                             width: MediaQuery
                    //                                 .of(context)
                    //                                 .size
                    //                                 .width * 0.24 - 80,
                    //                             child: Text(news2, style: NewsStyle,
                    //                                 maxLines: null)),
                    //                         SizedBox(width: 40)
                    //
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //             Stack(
                    //               children: [
                    //
                    //                 Container(
                    //                   decoration: BoxDecoration(
                    //                       image: DecorationImage(
                    //                           fit: BoxFit.cover,
                    //                           image: AssetImage(
                    //                               'images/Game3.PNG'
                    //                           )
                    //                       )
                    //                   ),
                    //                   height: MediaQuery
                    //                       .of(context)
                    //                       .size
                    //                       .height * 0.75,
                    //                   width: MediaQuery
                    //                       .of(context)
                    //                       .size
                    //                       .width * 0.24,
                    //                   child: Center(
                    //                     child: Row(
                    //                       children: [
                    //                         SizedBox(width: 40),
                    //                         Container(
                    //                             width: MediaQuery
                    //                                 .of(context)
                    //                                 .size
                    //                                 .width * 0.24 - 80,
                    //                             child: Text(news3, style: NewsStyle,
                    //                                 maxLines: null)),
                    //                         SizedBox(width: 40)
                    //
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //           ],
                    //         ) : Container(
                    //           child: Column(
                    //             children: <Widget>[
                    //               SizedBox(height: MediaQuery
                    //                   .of(context)
                    //                   .size
                    //                   .height * 0.03),
                    //               Stack(
                    //                 children: [
                    //                   Container(
                    //                     decoration: BoxDecoration(
                    //                         image: DecorationImage(
                    //                             fit: BoxFit.cover,
                    //                             image: AssetImage(
                    //                                 'images/Game1.PNG'
                    //                             )
                    //                         )
                    //                     ),
                    //                     height: MediaQuery
                    //                         .of(context)
                    //                         .size
                    //                         .height * 0.75,
                    //                     width: MediaQuery
                    //                         .of(context)
                    //                         .size
                    //                         .width * 0.8,
                    //                     child: Center(
                    //                       child: Row(
                    //                         children: [
                    //                           SizedBox(width: 10),
                    //                           Container(
                    //                               width: MediaQuery
                    //                                   .of(context)
                    //                                   .size
                    //                                   .width * 0.8 - 20,
                    //                               child: Text(news1, style: NewsStyle,
                    //                                   maxLines: null)),
                    //                           SizedBox(width: 10)
                    //
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   )
                    //                 ],
                    //               ),
                    //               SizedBox(height: MediaQuery
                    //                   .of(context)
                    //                   .size
                    //                   .height * 0.03),
                    //               Stack(
                    //                 children: [
                    //                   Container(
                    //                     decoration: BoxDecoration(
                    //                         image: DecorationImage(
                    //                             fit: BoxFit.cover,
                    //                             image: AssetImage(
                    //                                 'images/Game2.PNG'
                    //                             )
                    //                         )
                    //                     ),
                    //                     height: MediaQuery
                    //                         .of(context)
                    //                         .size
                    //                         .height * 0.75,
                    //                     width: MediaQuery
                    //                         .of(context)
                    //                         .size
                    //                         .width * 0.8,
                    //                     child: Center(
                    //                       child: Row(
                    //                         children: [
                    //                           SizedBox(width: 10),
                    //                           Container(
                    //                               width: MediaQuery
                    //                                   .of(context)
                    //                                   .size
                    //                                   .width * 0.8 - 20,
                    //                               child: Text(news2, style: NewsStyle,
                    //                                   maxLines: null)),
                    //                           SizedBox(width: 10)
                    //
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   )
                    //                 ],
                    //               ),
                    //               SizedBox(height: MediaQuery
                    //                   .of(context)
                    //                   .size
                    //                   .height * 0.03),
                    //               Stack(
                    //                 children: [
                    //                   Container(
                    //                     decoration: BoxDecoration(
                    //                         image: DecorationImage(
                    //                             fit: BoxFit.cover,
                    //                             image: AssetImage(
                    //                                 'images/Game3.PNG'
                    //                             )
                    //                         )
                    //                     ),
                    //                     height: MediaQuery
                    //                         .of(context)
                    //                         .size
                    //                         .height * 0.75,
                    //                     width: MediaQuery
                    //                         .of(context)
                    //                         .size
                    //                         .width * 0.8,
                    //                     child: Center(
                    //                       child: Row(
                    //                         children: [
                    //                           SizedBox(width: 10),
                    //                           Container(
                    //                               width: MediaQuery
                    //                                   .of(context)
                    //                                   .size
                    //                                   .width * 0.8 - 20,
                    //                               child: Text(news3, style: NewsStyle,
                    //                                   maxLines: null)),
                    //                           SizedBox(width: 10)
                    //
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   )
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         SizedBox(height: 30,)
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Text(
                      "Latest News",
                      style: style3,
                    ),
                    SizedBox(height: 20),
                    //TODO: Make this like bethesda news
                    gridNews(context),

                    //     Column(
                    //     children: [
                    //       Container(
                    //         height:uniHeight(context)*0.7,
                    //         width:uniWidth(context),
                    //         child: CarouselSlider(
                    //           carouselController: carouselController,
                    //           items: imgList,
                    //           options: CarouselOptions(
                    //               autoPlay: true,
                    //               enlargeCenterPage: true,
                    //               aspectRatio: 0.7/1,
                    //               onPageChanged: (index, reason) {
                    //                 setState(() {
                    //                   _current = index;
                    //                 });
                    //               }
                    //           ),
                    //         ),
                    //       ),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: imgList.map((url) {
                    //           int index = imgList.indexOf(url);
                    //           return GestureDetector(
                    //             onTap:(){
                    //
                    //               setState((){
                    //                 _current = index;
                    //                 carouselController.animateToPage(index);
                    //               });
                    //             },
                    //             child: Container(
                    //               width: 18.0,
                    //               height: 18.0,
                    //               margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    //               decoration: BoxDecoration(
                    //                 shape: BoxShape.circle,
                    //                 color: _current == index
                    //                     ? Colors.amber
                    //                     : Colors.white,
                    //               ),
                    //             ),
                    //           );
                    //         }).toList(),
                    //       ),
                    //     ]
                    // ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    Text("RAISE HELL ON THE BATTLEFIELD",
                        style: TextStyle(
                            color: Colors.amber[600],
                            fontSize: 54,
                            fontFamily: "Heading1",
                            letterSpacing: 6)),
                    SizedBox(height: 30),
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.076,
                      child: FlatButton(
                        onPressed: () {
                          _homeScrollController.animateTo(
                            0.0,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 1000),
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Respawn",
                            style: TextStyle(
                                fontFamily: "Longless",
                                fontWeight: FontWeight.bold,
                                fontSize: 32),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Container(
                    //   height:uniHeight(context)*0.4,
                    //   width:uniWidth(context),
                    //   color:Colors.lightBlue,
                    //   child:Row(
                    //     mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    //     children:socials1
                    //   )
                    // ),
                    Footer(context)
                  ],
                ),
              ),
            ),
          ),
          // Container(
          //     alignment: Alignment.centerRight,
          //     height: uniHeight(context),
          //     width: 20.0,
          //     margin: EdgeInsets.only(left: MediaQuery.of(context).size.width - 20.0),
          //     decoration: BoxDecoration(color: Colors.black12),
          //     child: Container(
          //       alignment: Alignment.topCenter,
          //       child: GestureDetector(
          //         child: Container(
          //           height: 50.0,
          //           width: 15.0,
          //           margin:
          //           EdgeInsets.only(left: 5.0, right: 5.0, top: _offset),
          //           decoration: BoxDecoration(
          //               color: Colors.grey[600],
          //              ),
          //         ),
          //         onVerticalDragUpdate: (dragUpdate) {
          //           _homeScrollController.position.moveTo(dragUpdate.globalPosition.dy * 3.5);
          //           setState(() {
          //             if(dragUpdate.globalPosition.dy >= 0) {
          //               _offset = dragUpdate.globalPosition.dy;
          //             }
          //             print("View offset ${_homeScrollController.offset} scroll-bar offset ${_offset}");
          //           });
          //         },
          //       ),
          //     )
          // ),
        ],
      ),
    );
  }

  void makeVWidgetList() async {
    FirebaseFirestore.instance
        .collection("Videos")
        .limit(3)
        .get()
        .then((querySnapshot) {
      var result;
      double width = isLaptop(context)
          ? (MediaQuery.of(context).size.width * 0.29)
          : (MediaQuery.of(context).size.width * 0.9);
      double height = (MediaQuery.of(context).size.height * 0.35);
      for (result in querySnapshot.docs) {
        var videoBox12 = videoElement(
            result['Link'], result['Link'] + "ÏD101", height, width);
        videoWidgetList.add(videoBox12);
        videoWidgetList.add(SizedBox(width: 30));
      }
      setState(() {});
    });
  }

  Container signContainer() {
    return Container(
      height: 50,
      constraints: BoxConstraints(minWidth: 200),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 3, color: Colors.black)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.network(
              photo,
              errorBuilder: (context, error, stack) {
                return Icon(
                  Icons.account_circle,
                  size: 40,
                  color: Colors.grey,
                );
              },
              width: 40.0,
              height: 40.0,
              fit: BoxFit.cover,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
          ),
          SizedBox(width: 20),
          Text(
            name == null ? "Not Logged In" : name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: PopupMenuButton<Choice>(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onSelected: onItemMenuPress,
              itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return PopupMenuItem<Choice>(
                      value: choice,
                      child: Row(
                        children: <Widget>[
                          Icon(choice.icon, color: Colors.black),
                          Container(
                            width: 10.0,
                          ),
                          Text(
                            choice.title,
                            style: TextStyle(),
                          ),
                        ],
                      ));
                }).toList();
              },
            ),
          ),
        ],
      ),
    );
  }

  void setData() async {
    homePrefs = await SharedPreferences.getInstance();
    name = homePrefs.getString("nickname");
    name = name == null || name == "" ? "" : name;
    photo = homePrefs.getString("photoUrl");
    photo = photo == null || photo == "" ? "" : "photo";
    setState(() {
      choices = name == ''
          ? <Choice>[
              const Choice(title: 'Profile', icon: Icons.account_circle),
              const Choice(title: "Log in", icon: Icons.exit_to_app),
            ]
          : <Choice>[
              const Choice(title: 'Profile', icon: Icons.account_circle),
              const Choice(title: "Log out", icon: Icons.exit_to_app),
            ];
    });
  }

  void onItemMenuPress(Choice choice) async {
    if (choice.title == 'Log out') {
      await FirebaseAuthService.signOut();
      setState(() {});
    } else if (choice.title == 'Log in') {
      Navigator.of(context).pushNamed(Login.route);
    } else {
      Navigator.of(context).pushNamed(Profile.route);
    }
  }

  // Widget makeLaptopExpandableImage(String image){
  //   bool _hovering1 = false;
  //   return      AnimatedContainer(
  //     curve: Curves.fastOutSlowIn,
  //
  //     duration:Duration(seconds:1),
  //     height:!_hovering1? MediaQuery
  //         .of(context)
  //         .size
  //         .height * 0.45:
  //     MediaQuery
  //         .of(context)
  //         .size
  //         .height * 0.47,
  //     width: !_hovering1? MediaQuery
  //         .of(context)
  //         .size
  //         .width * 0.28:
  //     MediaQuery
  //         .of(context)
  //         .size
  //         .width * 0.3,
  //     child: MouseRegion(
  //       onEnter: (e){
  //         _hovering1 = true;
  //         setState(() {
  //
  //         });
  //       },
  //       onExit: (e){
  //         _hovering1 = false;
  //         setState((){});
  //       },
  //       child: Image(
  //         fit: BoxFit.cover,
  //         image: NetworkImage(
  //             image
  //         ),
  //       ),
  //     ),
  //   );
  // }
  Container makeNewsContainer(String image, String heading, String para) {
    return Container(
        height: uniHeight(context) * 0.8,
        width: uniWidth(context),
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Container(
              color: Colors.black.withOpacity(0.3),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(heading.toUpperCase(),
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Heading1")),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 200),
                child: Text(para,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Jura",
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: null),
              )
            ]),
          ],
        ));
  }
}

class videoBox2 extends StatefulWidget {
  String Video;
  videoBox2(this.Video);
  @override
  _videoBox2State createState() => _videoBox2State(Video);
}

class _videoBox2State extends State<videoBox2> {
  String Video;
  IFrameElement iFrame = IFrameElement();

  _videoBox2State(this.Video);
  @override
  Widget build(BuildContext context) {
    iFrame.width = isLaptop(context)
        ? (MediaQuery.of(context).size.width * 0.35).toString()
        : (MediaQuery.of(context).size.width * 0.9).toString();
    iFrame.height = (MediaQuery.of(context).size.height * 0.25).toString();
    iFrame.src = "https://www.youtube.com/embed/" + Video;
    iFrame.allowFullscreen = true;
    // ignore: undefined_prefixed_name
    // ui.platformViewRegistry.registerViewFactory(
    //   'i'+Video,
    //       (int viewId) =>iFrame,
    // );
    return
//    GestureDetector(
//        onTap:(){
//          _controller.value.isPlaying?
//          _controller.pause()
//              :_controller.play();
//        },
//        child: Container(
//          width:MediaQuery.of(context).size.width*0.7,
//          decoration: BoxDecoration(
//              color: Colors.white,
//              borderRadius: BorderRadius.all(Radius.circular(15))
//          ),
//          child:  VideoPlayer(_controller),
//        )
//    );
        //Chewie One
        // Chewie(
        //   controller: _chewieController,
        // );
        Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: isLaptop(context)
                ? MediaQuery.of(context).size.width * 0.31
                : MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: HtmlElementView(key: UniqueKey(), viewType: 'i' + Video));
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

class makeImageContainer extends StatefulWidget {
  String bgImage;
  String heading1;
  String heading2;
  String para;
  String buttonText;
  String goToPage;
  makeImageContainer(this.bgImage, this.heading1, this.heading2, this.para,
      this.buttonText, this.goToPage);

  @override
  _makeImageContainerState createState() => _makeImageContainerState(
      bgImage, heading1, heading2, para, buttonText, goToPage);
}

class _makeImageContainerState extends State<makeImageContainer>
    with TickerProviderStateMixin {
  String bgImage;
  String heading1;
  String heading2;
  String para;
  String buttonText;
  String route;
  _makeImageContainerState(this.bgImage, this.heading1, this.heading2,
      this.para, this.buttonText, this.route);
  bool faded = false;
  bool colored = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          MouseRegion(
            onEnter: (_) {
              setState(() {
                faded = true;
              });
            },
            onExit: (_) {
              setState(() {
                faded = false;
              });
            },
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 600),
              opacity: faded ? 0.4 : 1,
              child: Container(
                height: isLaptop(context)
                    ? uniWidth(context) * 0.3
                    : uniWidth(context) * 0.87,
                width: isLaptop(context)
                    ? uniWidth(context) * 0.24
                    : uniWidth(context) * 0.9,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(bgImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Container(
              height: isLaptop(context)
                  ? uniWidth(context) * 0.3
                  : uniWidth(context) * 0.87,
              width: isLaptop(context)
                  ? uniWidth(context) * 0.24
                  : uniWidth(context) * 0.9,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: Stack(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Center(
                            child: Text(heading1.toUpperCase(),
                                style: GoogleFonts.secularOneTextTheme()
                                    .headline1
                                    .merge(TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber[800],
                                    ))),
                          ),
                          SizedBox(height: 8),
                          Text(heading2.toUpperCase(),
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: "Heading1",
                                color: Colors.white,
                              )),
                          SizedBox(height: 20),
                          Flexible(
                            child: Text(para,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: null),
                          ),
                          SizedBox(height: 12),
                        ]),
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: <
                        Widget>[
                      Center(
                        child: MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              colored = true;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              colored = false;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            height: 50,
                            decoration: BoxDecoration(
                              color: colored ? Colors.black : Colors.white,
                              // border:Border.all(color:Colors.black,width:1)
                            ),
                            width: isLaptop(context)
                                ? uniWidth(context) * 0.11
                                : uniWidth(context) * 0.2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: FlatButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, route);
                                  },
                                  child: Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                        top: BorderSide(
                                            color: Color.fromRGBO(0, 0, 0, 0)),
                                        right: BorderSide(
                                            color: Color.fromRGBO(0, 0, 0, 0)),
                                        bottom: BorderSide(
                                            color: Color.fromRGBO(0, 0, 0, 0),
                                            width: 1),
                                        left: BorderSide(
                                            color: Color.fromRGBO(0, 0, 0, 0)),
                                      )),
                                      child: Text("View More".toUpperCase(),
                                          style: TextStyle(
                                              color: colored
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 20)),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40)
                    ])
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
