import 'dart:html';

import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';
import 'package:xspectre/Community.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xspectre/Squad.dart';
import 'package:xspectre/T&C.dart';
import 'package:xspectre/help/Footer.dart';
import 'package:xspectre/help/appBar.dart';
import 'help/HTMLelement.dart';

import 'AddVideos.dart';
import 'Home.dart';
import 'JoinUs.dart';
import 'Profile.dart';
import 'Styles.dart';
import 'help/IsPhone.dart';
class VideoPage extends StatefulWidget {
  static const String route = '/videos';
  @override
  _VideoPageState createState() => _VideoPageState();
}
List<Widget> WidgetList = [Center(child:CircularProgressIndicator(),)];

class _VideoPageState extends State<VideoPage> {
  String creator ='';
  String videos = '';
  String game = '';
  final _scrollController = ScrollController();

  @override
  void initState(){
    super.initState();
    makeWidgetList();
  }

  @override
  Widget build(BuildContext context) {
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
                        leading: Icon(Icons.face),
                        title: Text("Community"),
                        onTap: () {
                          Navigator.of(context).pushNamed(Community.route);
                        }),
                    Container(
                      color: Colors.grey[400],
                      child: ListTile(
                        leading: Icon(Icons.filter),
                        title: Text("Videos"),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.people),
                      title: Text("Squad"),
                      onTap: () {
                        Navigator.of(context).pushNamed(Squad.route);
                      },
                    ),
                    ListTile(
                      title: Text("Join Us"),
                      leading: FaIcon(FontAwesomeIcons.headset),
                      onTap: () {
                        Navigator.of(context).pushNamed(JoinUs.route);
                      },
                    ),
                    ListTile(
                        leading:FaIcon(FontAwesomeIcons.scroll) ,
                        title: Text("T&C"),
                        onTap: () {
                          Navigator.of(context).pushNamed(Terms.route);
                        }),
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
                    //     Navigator.of(context).pushNamed(Profile.route);
                    //   },
                    // ),
                  ]
              )
          )
      ),
      backgroundColor: Colors.white,
      body:Container(
        decoration:BoxDecoration(
          image:DecorationImage(
            image:AssetImage("images/VideosBackground.webp"),
            fit:BoxFit.cover
          )
        ),
        child: SmoothScrollWeb(
          controller: _scrollController,
          child: SingleChildScrollView(
            physics:NeverScrollableScrollPhysics(),
            controller: _scrollController,
            child: Column(
              children: <Widget>[
          //   AppBar(
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
          //   actions: !isLaptop(context)?<Widget>[]:<Widget>[
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         FlatButton(
          //             child:Text("Home", style:TextStyle(
          //               letterSpacing:3,
          //               fontSize:12,
          //               color:Colors.white,
          //             )),
          //             onPressed: () {
          //               Navigator.of(context).pushNamed(Home.route);
          //             }
          //         ),
          //         FlatButton(
          //           child:Text("Videos", style:TextStyle(
          //               letterSpacing:3,
          //               fontSize:12,
          //               color:Colors.blue
          //           )),
          //
          //         ),FlatButton(
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
          //         // FlatButton(
          //         //     child:Text("Profile", style:TextStyle(
          //         //         letterSpacing:3,
          //         //         fontSize:12,
          //         //         color:Colors.white
          //         //     )),
          //         //     onPressed: () {
          //         //       Navigator.pushReplacement(context, MaterialPageRoute(
          //         //           builder: (context) => Profile()),
          //         //       );
          //         //     }
          //         // ),
          //         SizedBox(width:20)
          //       ],
          //     ),
          //
          //   ],
          // ),
                appBar("Videos", context),
            // Container(
            //   height:uniHeight(context)*0.3,
            //   width:uniWidth(context),
            //   child: Image(
            //     fit:BoxFit.cover,
            //     image: NetworkImage(
            //         "http://demo.gloriathemes.com/wp/cloux/wp-content/uploads/2018/01/block-bg-1920x209.jpg"
            //     ),
            //   ),
            // ),
                isLaptop(context)?Container(
                  height:uniHeight(context)*0.3,
                  // color:Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width:30),
                      Container(
                        decoration: BoxDecoration(
                            color:Colors.grey[900],
                            border:Border.all(color:Colors.white,width:1.0)
                        ),
                        width: MediaQuery.of(context).size.width *0.18 ,
                        height:56,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
                            child: Form(
                              child: TextFormField(
                                style: TextStyle(
                                    color:Colors.white,
                                    fontSize: 12,
                                    fontFamily:"Lulo"
                                ),
                                keyboardType: TextInputType.text,
                                onFieldSubmitted: (text) {
                                  creator = text;
                                  setState(() {
                                    makeWidgetList();
                                  });
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Search by creator',
                                  enabledBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                            color: Color.fromRGBO(0,0,0,0)
                                        )),
                                    focusedBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                        color: Color.fromRGBO(0,0,0,0)
                                        )),
                                  hintStyle: TextStyle(
                                      color:Colors.white,
                                      fontSize: 12,
                                      fontFamily:"Lulo"
                                  )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color:Colors.grey[900],
                            border:Border.all(color:Colors.white,width:1.0)
                        ),
                        width: MediaQuery.of(context).size.width *0.18 ,
                        height:56,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,0,0,0),
                            child: Form(
                              child: TextFormField(
                                style: TextStyle(
                                    color:Colors.white,
                                    fontSize: 12,
                                    fontFamily:"Lulo"
                                ),
                                keyboardType: TextInputType.text,
                                onFieldSubmitted: (text) {
                                  videos = text;
                                  setState(() {
                                    makeWidgetList();
                                  });
                                },
                                decoration: const InputDecoration(
                                    hintText: 'Search by title',
                                    enabledBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                        color: Color.fromRGBO(0,0,0,0)
                                    )),
                                    focusedBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                        color: Color.fromRGBO(0,0,0,0)
                                    )),
                                    hintStyle: TextStyle(
                                        color:Colors.white,
                                        fontSize: 12,
                                        fontFamily:"Lulo"
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),   Container(
                        decoration: BoxDecoration(
                            color:Colors.grey[900],
                            border:Border.all(color:Colors.white,width:1.0)
                        ),
                        width: MediaQuery.of(context).size.width *0.18 ,
                        height:56,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
                          child: Form(
                            child: TextFormField(
                              style: TextStyle(
                                  color:Colors.white,
                                  fontSize: 12,
                                  fontFamily:"Lulo"
                              ),
                              keyboardType: TextInputType.text,
                              onFieldSubmitted: (text) {
                                game = text;
                                setState(() {
                                  makeWidgetList();
                                });
                              },
                              decoration: const InputDecoration(
                                  hintText: 'Search by game',
                                  enabledBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                      color: Color.fromRGBO(0,0,0,0)
                                  )),
                                  focusedBorder:  UnderlineInputBorder(borderSide:BorderSide(
                                      color: Color.fromRGBO(0,0,0,0)
                                  )),
                                  hintStyle: TextStyle(
                                      color:Colors.white,
                                      fontSize: 12,
                                      fontFamily:"Lulo"
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                      DropDownBox(),
                      DropDownBox2(),
                    ],
                  ),
                ):Column(
                  children: [
                    SizedBox(height:10),
                    Container(
                      decoration: BoxDecoration(
                          border:Border.all(color:Colors.white,width:1.0)
                      ),
                      width: MediaQuery.of(context).size.width *0.9 ,
                      height:66,
                      child: Form(
                        child: TextFormField(
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 16,
                              fontFamily:"PoppinsThin"
                          ),
                          keyboardType: TextInputType.text,
                          onFieldSubmitted: (text) {
                            creator = text;
                            setState(() {
                              makeWidgetList();
                            });
                          },
                          decoration: const InputDecoration(
                              hintText: 'Search by creator',
                              hintStyle: TextStyle(
                                  color:Colors.white,
                                  fontSize: 16,
                                  fontFamily:"PoppinsThin"
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:10),

                    Container(
                      decoration: BoxDecoration(
                          border:Border.all(color:Colors.white,width:1.0)
                      ),
                      width: MediaQuery.of(context).size.width *0.9 ,
                      height:66,
                      child: Form(
                        child: TextFormField(
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 16,
                              fontFamily:"PoppinsThin"
                          ),
                          keyboardType: TextInputType.text,
                          onFieldSubmitted: (text) {
                            videos = text;
                            setState(() {
                              makeWidgetList();
                            });
                          },
                          decoration: const InputDecoration(
                              hintText: 'Search by video',
                              hintStyle: TextStyle(
                                  color:Colors.white,
                                  fontSize: 16,
                                  fontFamily:"PoppinsThin"
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:10),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      width: MediaQuery.of(context).size.width *0.9 ,
                      height: 56,
                      child: Form(
                        child: TextFormField(
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 12,
                              fontFamily:"Lulo"
                          ),
                          keyboardType: TextInputType.text,
                          onFieldSubmitted: (text) {
                            game = text;
                            setState(() {
                              makeWidgetList();
                            });
                          },
                          decoration: const InputDecoration(
                              hintText: 'Search by game',
                              hintStyle: TextStyle(
                                  color:Colors.white,
                                  fontSize: 12,
                                  fontFamily:"Lulo"
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:10),
                    DropDownBox(),
                    SizedBox(height:10),
                    DropDownBox2(),
                  ],
                ),SizedBox(height:30)]+WidgetList+[
                SizedBox(height: 40,),
                Footer(context),
              ],
            ),
          ),
        ),
      ),

    );
  }
  void makeWidgetList() async{

    FirebaseFirestore.instance.collection("Videos").get().then((querySnapshot){
      WidgetList = [];
      List<Widget> RowWidgetList = [];
      int count = 1;
      var result;
      for (result in querySnapshot.docs) {

        if(
            result['Creator'].toString().toLowerCase().contains(creator.toString().toLowerCase()) &&
            result['Name'].contains(videos) &&
            result['Game'].toString().toLowerCase().contains(game.toString().toLowerCase()) &&
            result['Type'].toString().toLowerCase().contains(type1.toString().contains("Select")?"":type1.toString().toLowerCase()) &&
            result['platform'].toString().toLowerCase().contains(platform.toString().contains("Select")?"":platform.toString().toLowerCase())
        ) {
          if (isLaptop(context)) {
            WidgetList.add(SizedBox(height: 20));
            RowWidgetList.add(
              Container(
                  child: videoBox(result['Link'])
              ),
            );
            if (count < 3) {
              count += 1;
            }
            else {
              WidgetList.add(Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: RowWidgetList,
              ));
              WidgetList.add(SizedBox(height: 25.0,));
              RowWidgetList = [];
              count = 1;
              setState(() {});
            }
          }
          else{
            WidgetList.add(
              Container(
                  height: 300,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.96,
                  child: videoBox(result['Link'])
              ),
            );
            WidgetList.add(
              SizedBox(height:20)
            );
          }
        }
      }
      setState(() {
      });
    });
  }

}
class videoBox extends StatefulWidget {
  String Video;
  videoBox(this.Video);
  @override
  _videoBoxState createState() => _videoBoxState(Video);
}

class _videoBoxState extends State<videoBox> {
  String Video;
  _videoBoxState(this.Video);

  @override
  Widget build(BuildContext context) {
    double width = isLaptop(context)?(MediaQuery.of(context).size.width*0.29):(MediaQuery.of(context).size.width*0.9);
    double height = (MediaQuery.of(context).size.height*0.35);
    // ignore: undefined_prefixed_name
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:14,horizontal:26.0),
      child: videoElement(Video,'code-$Video', height, width)

    ) ;
  }
}
String type1 = 'Select Category';
String platform = 'Select Category';
class DropDownBox extends StatefulWidget {
  @override
  _DropDownBoxState createState() => _DropDownBoxState();
}

class _DropDownBoxState extends State<DropDownBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:56,
      decoration: BoxDecoration(
          color:Colors.grey[900],
          border: Border.all(color:Colors.white,width:1.0)
      ),
      width: isLaptop(context)? uniWidth(context) *0.18:uniWidth(context) *0.9 ,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8,0,0,0),
        child: DropdownButton<String>(
          isExpanded: true,
          value: type1,
          icon: Icon(Icons.arrow_downward,color:Colors.white),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(
              color:Colors.white,
              fontSize: 12,
              fontFamily:"Lulo"
          ),
          underline: Container(

          ),
          onChanged: (String newValue) {
            setState(() {
              type1 = newValue;
            });
          },
          dropdownColor: Colors.grey[900],
          items: <String>['Select Category','Montages', 'Trickshots', 'Stream', 'Memes','Walkthrough','Gameplay','Other']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,style:TextStyle(
                  color:Colors.white,
                  fontSize: 12,
                  fontFamily:"Lulo"
              )),
            );
          }).toList(),
        ),
      ),
    );
  }
}
class DropDownBox2 extends StatefulWidget {
  @override
  _DropDownBox2State createState() => _DropDownBox2State();
}

class _DropDownBox2State extends State<DropDownBox2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:56,
      width: isLaptop(context)? MediaQuery.of(context).size.width *0.18:MediaQuery.of(context).size.width *0.9 ,
      decoration: BoxDecoration(
          color:Colors.grey[900],
          border:Border.all(color:Colors.white,width:1)
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8,0,0,0),
        child: DropdownButton<String>(
          value: platform,
          isExpanded: true,
          icon: Icon(Icons.arrow_downward,color:Colors.white),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(
              color:Colors.white,
              fontSize: 12,
              fontFamily:"Lulo"
          ),
          underline: Container(
          ),
          onChanged: (String newValue) {
            setState(() {
              platform = newValue;
            });
          },
          dropdownColor: Colors.grey[900],
          items: <String>['Select Category','Youtube', 'Twitch', 'Instagram']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,style:TextStyle(
                  color:Colors.white,
                  fontSize: 12,
                  fontFamily:"Lulo"
              )),
            );
          }).toList(),
        ),
      ),
    );
  }
}

