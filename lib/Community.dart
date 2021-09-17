import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xspectre/help/appBar.dart';
import 'AddVideos.dart';
import 'Home.dart';
import 'JoinUs.dart';
import 'Profile.dart';
import 'Squad.dart';
import 'Styles.dart';
import 'T&C.dart';
import 'Videos.dart';
import 'help/Footer.dart';
import 'help/HeroDialogRoute.dart';
import 'help/IsPhone.dart';

class Community extends StatefulWidget {
  static const String route = '/community';
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  GlobalKey<FormState> key1 = GlobalKey<FormState>();
  String creator = '';
  ScrollController _communityController = ScrollController();

  List<Widget> widgetList = [
    SizedBox(height: 200),
    CircularProgressIndicator(),
    SizedBox(height: 200),
  ];

  var result;

  @override
  void initState() {
    makeWidgetList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Container(
          width: MediaQuery.of(context).size.width * 0.5, //20.0,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: SmoothScrollWeb(
            controller: _communityController,
            child: SingleChildScrollView(
                controller: _communityController,
                physics: NeverScrollableScrollPhysics(),
                child: Column(children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                    onTap: () {
                      Navigator.of(context).pushNamed(Home.route);
                    },
                  ),
                  Container(
                    color: Colors.grey[400],
                    child: ListTile(
                        leading: Icon(Icons.face),
                        title: Text("Community"),
                        onTap: () {
                          Navigator.of(context).pop();
                        }),
                  ),
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
                      Navigator.of(context).pushNamed(Squad.route);
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
                  //     Navigator.of(context).pushNamed(Squad.route);
                  //
                  //   },
                  // ),
                ])),
          )),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/CommunityBG.webp"), fit: BoxFit.cover),
        ),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
                  appBar("Community", context),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[900],
                            border:
                                Border.all(color: Colors.yellow, width: 1.0)),
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: 66,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: TextFormField(
                              key: key1,
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 16,
                                  fontFamily: "PoppinsThin"),
                              keyboardType: TextInputType.text,
                              onFieldSubmitted: (text) {
                                creator = text;
                                setState(() {
                                  makeWidgetList();
                                });
                              },
                              decoration: const InputDecoration(
                                  hintText: 'Search by creator',
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(0, 0, 0, 0))),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(0, 0, 0, 0))),
                                  hintStyle: TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 12,
                                      fontFamily: "Lulo")),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: uniWidth(context) * 0.258),
                      SizedBox(width: uniWidth(context) * 0.258),
                    ],
                  )
                ] +
                widgetList +
                [
                  SizedBox(
                    height: 20,
                  ),
                  Footer(context)
                  // Container(
                  //     height:uniHeight(context)*0.4,
                  //     width:uniWidth(context),
                  //     color:Colors.lightBlue,
                  //     child:Row(
                  //         mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  //         children:socials1
                  //     )
                  // ),
                ],
          ),
        ),
      ),
    );
  }

  void makeWidgetList() async {
    FirebaseFirestore.instance
        .collection("Creators")
        .get()
        .then((querySnapshot) {
      widgetList = [];
      List<Widget> RowWidgetList = [];
      int count = 1;

      for (result in querySnapshot.docs) {
        if (result['Name']
            .toString()
            .toLowerCase()
            .contains(creator.toLowerCase())) {
          widgetList.add(SizedBox(height: 20));
          // RowWidgetList.add(
          //     Row(
          //       children: [
          //         Container(
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.all(Radius.circular(15.0)),
          //               color: Colors.white,
          //               border: Border.all(
          //                 color: Colors.black,
          //                 width: 3,
          //               )),
          //           height: isLaptop(context)?MediaQuery.of(context).size.height * 0.3: MediaQuery.of(context).size.height * 0.41,
          //           width:isLaptop(context)?MediaQuery.of(context).size.width * 0.465: MediaQuery.of(context).size.width * 0.97,
          //           child: Column(
          //             children: [
          //               Row(
          //                 children: [
          //                   CircleAvatar(
          //                     backgroundImage:NetworkImage(result['banner']),
          //                     radius: 60,
          //                   ),
          //                   SizedBox(width:30),
          //                   Column(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: [
          //                       Text(result['Name'].toString().toUpperCase(),style: TextStyle(
          //                         color: Colors.black,
          //                         fontSize: 26,
          //                         fontWeight: FontWeight.bold,
          //                       ),),
          //                       Text(result['Title'].toString().toUpperCase(),style: result['Title'].toString().toLowerCase().startsWith("y")?TextStyle(
          //                         color: Colors.red,
          //                         fontSize: 30,
          //                         fontWeight: FontWeight.bold
          //                       ):TextStyle(
          //                         color: Colors.blue,
          //                         fontSize: 30,
          //                           fontWeight: FontWeight.bold
          //
          //                       ),),
          //                       ChallengeButton(result['mail'],result['Name']),
          //                       ViewChannelButton(result['channel_link']),
          //                     ],
          //                   ),
          //
          //                 SizedBox(width: 35,),
          //                  isLaptop(context)?Socials(result):Container()
          //                 ],
          //               ),
          //               isLaptop(context)?Container():SizedBox(height:20),
          //               isLaptop(context)?Container():Socials2(result)
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          // );
          RowWidgetList.add(makeGamerProfile(result));
          if (isLaptop(context) && count <= 2) {
            count += 1;
          } else {
            widgetList.add(Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: RowWidgetList,
            ));
            widgetList.add(SizedBox(
              height: 25.0,
            ));
            RowWidgetList = [];
            count = 1;
            setState(() {});
          }
        }
      }
      setState(() {});
    });
  }
}

class makeGamerProfile extends StatefulWidget {
  var resul;
  makeGamerProfile(this.resul);
  @override
  _makeGamerProfileState createState() => _makeGamerProfileState(resul);
}

class _makeGamerProfileState extends State<makeGamerProfile> {
  var resul;
  bool hovering = false;
  _makeGamerProfileState(this.resul);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.push(context,
            HeroDialogRoute(builder: (BuildContext context) {
          return Center(
            child: Hero(
              tag: 'board-' + resul['Name'],
              child: SimpleDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                backgroundColor: Colors.amber,
                children: [
                  Container(
                    height: uniHeight(context) - 10,
                    color: Colors.amber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: uniHeight(context) * 0.3,
                          color: Colors.white,
                          child: Image(
                              image: NetworkImage(resul['banner']),
                              fit: BoxFit.cover),
                        ),
                        SizedBox(height: 5),
                        Text(
                          resul['Name'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              fontFamily: "Heading1"),
                        ),
                        SizedBox(height: 5),
                        Text(
                          resul['Title'],
                          style: TextStyle(
                              color: resul['Title']
                                      .toString()
                                      .toLowerCase()
                                      .startsWith("y")
                                  ? Colors.red
                                  : Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              fontFamily: "Heading1"),
                        ),
                        SizedBox(height: 5),
                        Container(
                            height: uniHeight(context) * 0.1,
                            width: isLaptop(context)
                                ? uniWidth(context) * 0.3
                                : uniWidth(context) - 15,
                            child:
                                ChallengeButton(resul['mail'], resul['Name'])),
                        SizedBox(height: 5),
                        Container(
                            height: uniHeight(context) * 0.1,
                            width: isLaptop(context)
                                ? uniWidth(context) * 0.3
                                : uniWidth(context) - 15,
                            child: viewChannelButton(resul['channel_link'])),
                        SizedBox(height: 20),
                        Socials2(resul)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
      },
      child: Hero(
        tag: 'board-' + resul['Name'],
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              hovering = true;
            });
          },
          onExit: (_) {
            setState(() {
              hovering = false;
            });
          },
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 1),
                height: isLaptop(context) ? uniHeight(context) * 0.38 : 0.45,
                width: isLaptop(context) ? uniWidth(context) * 0.25 : 0.9,
                decoration: BoxDecoration(
                    color: hovering ? Colors.amber : Colors.white,
                    border: Border.all(color: Colors.black, width: 2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: isLaptop(context)
                            ? uniHeight(context) * 0.25
                            : 0.35,
                        width:
                            isLaptop(context) ? uniWidth(context) * 0.25 : 0.7,
                        color: Colors.white,
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(resul['banner']),
                        )),
                    Text(
                      resul['Name'],
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: "Heading1"),
                    ),
                    SizedBox(height: 5),
                    Text(
                      resul['Title'],
                      style: TextStyle(
                          color: resul['Title']
                                  .toString()
                                  .toLowerCase()
                                  .startsWith("y")
                              ? Colors.red
                              : Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: "Heading1"),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.1),
                height: isLaptop(context) ? uniHeight(context) * 0.38 : 0.45,
                width: isLaptop(context) ? uniWidth(context) * 0.25 : 0.9,
              )
            ],
          ),
        ),
      ),
    );
  }

  String createBody(mail, title) {
    String message = "mailto:" +
        mail +
        "?cc=xspectre.g@gmail.com&subject=Xspcetre%20Challenge%&body=Hey%20" +
        title +
        "0d%0aI%20challenge%20you%20to%20a%20game%20of%20(GAME)%20through%20Xspectre%20on%20(DATE)%20AT%20(TIME).%20(TYPE%20OF%20MATCH/EVENT%20AND%20DESCRIPTION)";
    return message;
  }

  Widget ChallengeButton(mail, title) {
    String email = mail;
    String Name = title;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        color: Colors.black,
      ),
      width:
          isLaptop(context) ? uniWidth(context) * 0.3 : uniWidth(context) - 15,
      height: uniHeight(context) * 0.1,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: FlatButton(
          color: Colors.black,
          onPressed: () {
            launch(createBody(email, Name));
          },
          child: Text(
            "CHALLENGE",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget viewChannelButton(link) {
    String channel = link;
    return InkWell(
      onTap: () {
        launch(link);
      },
      child: Container(
        width: isLaptop(context)
            ? uniWidth(context) * 0.3
            : uniWidth(context) - 15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            border: Border.all(color: Colors.black),
            color: Colors.white),
        child: Center(
          child: Text(
            "View Channel",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget Socials(Documents) {
    return Row(
      children: [
        Column(children: <Widget>[
          InkWell(
            onTap: () {
              launch(Documents['twitter']);
            },
            child: Container(
              width: 50,
              height: 50,
              child: Image(
                image: NetworkImage(""),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              launch(Documents['facebook']);
            },
            child: Container(
              width: 50,
              height: 50,
              child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://is1-ssl.mzstatic.com/image/thumb/Purple124/v4/9b/72/ff/9b72ff12-abee-c6f3-76de-79fb7db4afcd/Icon-Production-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/246x0w.png")),
            ),
          )
        ]),
        SizedBox(
          width: 15,
        ),
        Column(
          children: [
            InkWell(
              onTap: () {
                launch(Documents['instagram']);
              },
              child: Container(
                width: 50,
                height: 50,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/768px-Instagram_logo_2016.svg.png"),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                launch(Documents['discord']);
              },
              child: Container(
                width: 50,
                height: 50,
                child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "data:image/png;base64,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")),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget Socials2(Documents) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            launch(Documents['twitter']);
          },
          child: Container(
            width: 50,
            height: 50,
            child: Image(
              image: NetworkImage(
                  "https://lh3.googleusercontent.com/x3XxTcEYG6hYRZwnWAUfMavRfNNBl8OZweUgZDf2jUJ3qjg2p91Y8MudeXumaQLily0"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            launch(Documents['facebook']);
          },
          child: Container(
            width: 50,
            height: 50,
            child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://is1-ssl.mzstatic.com/image/thumb/Purple124/v4/9b/72/ff/9b72ff12-abee-c6f3-76de-79fb7db4afcd/Icon-Production-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/246x0w.png")),
          ),
        ),
        InkWell(
          onTap: () {
            launch(Documents['instagram']);
          },
          child: Container(
            width: 50,
            height: 50,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/768px-Instagram_logo_2016.svg.png"),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            launch(Documents['discord']);
          },
          child: Container(
            width: 50,
            height: 50,
            child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://yt3.ggpht.com/a/AATXAJw1tXvJInOnm44MdEF3kS0b8x-W4Twj27SYvJ9gRw=s900-c-k-c0xffffffff-no-rj-mo")),
          ),
        )
      ],
    );
  }
}
