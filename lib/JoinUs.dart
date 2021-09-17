import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';
import 'package:xspectre/Squad.dart';
import 'package:xspectre/help/Footer.dart';
import 'package:xspectre/help/appBar.dart';

import 'AddVideos.dart';
import 'Community.dart';
import 'Home.dart';
import 'Login/action_button_dark.dart';
import 'Profile.dart';
import 'Styles.dart';
import 'T&C.dart';
import 'Videos.dart';
import 'help/IsPhone.dart';

class JoinUs extends StatefulWidget {
  static const String route = '/join-us';
  @override
  _JoinUsState createState() => _JoinUsState();
}

class _JoinUsState extends State<JoinUs> {
  GlobalKey<FormState> key1 = GlobalKey<FormState>();
  GlobalKey<FormState> key2 = GlobalKey<FormState>();
  GlobalKey<FormState> key3 = GlobalKey<FormState>();
  GlobalKey<FormState> key4 = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController channelController = TextEditingController();
  TextEditingController socialsController = TextEditingController();
  ScrollController _joinUsController = ScrollController();
  String email = '';
  String password = '';
  String socials = '';
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
                    ListTile(
                      leading: Icon(Icons.people),
                      title: Text("Squad"),
                      onTap: () {
                        Navigator.of(context).pushNamed(Squad.route);
                      },
                    ),
                    Container(
                      color: Colors.grey[400],
                      child: ListTile(
                          leading: FaIcon(FontAwesomeIcons.headset),
                          title: Text("Join Us"),
                          onTap: () {
                            Navigator.of(context).pop();
                          }),
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
            image: DecorationImage(
                fit:BoxFit.cover,
                image: AssetImage("images/JoinUsBackground.webp")
            )
        ),
      child: SmoothScrollWeb(
        controller: _joinUsController,
        child: SingleChildScrollView(
          controller: _joinUsController,
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              appBar("Join Us", context),
              SizedBox(height:20),
              // Center(
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.black,
              //       borderRadius: BorderRadius.all(Radius.circular(22))
              //     ),
              //     height: 800,
              //     width:isLaptop(context)?uniWidth(context)*0.55:uniWidth(context) * 0.9,
              //     child: Padding(
              //       padding: const EdgeInsets.fromLTRB(20,0,0,0),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: <Widget>[
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Center(
              //                 child: Text("Join Our Community!",style: TextStyle(
              //                   letterSpacing: 3,
              //                     fontWeight: FontWeight.bold,
              //                     color: Colors.yellow,
              //                   fontFamily: "Nimble",
              //                   // fontWeight:FontWeight.bold,
              //                   fontSize: isLaptop(context)?40:30
              //                 ),),
              //               ),
              //             ],
              //           ),
              //           Text("Email",style:TextStyle(
              //             fontFamily:"Heading1",
              //             color:Colors.red,
              //             fontSize: 28,
              //           )),
              //           SizedBox(height: 10,),
              //           Container(
              //             decoration: BoxDecoration(
              //                 color: Colors.pink[400],
              //                 borderRadius: BorderRadius.all(Radius.circular(10))
              //             ),
              //             height:50,
              //             width: 500,
              //             child: Form(
              //               key: key1,
              //               child: TextFormField(
              //                 validator: (val){
              //                   if (val =="" || val == null){
              //                     return "This field is necessary";
              //                   }
              //                   return null;
              //                 },
              //                 style: TextStyle(
              //                     color:Colors.white,
              //                     fontFamily:"Heading1",
              //                     fontSize: 24
              //                 ),
              //                 keyboardType: TextInputType.emailAddress,
              //                 onChanged: (text) {
              //                   mail = text;
              //                 },
              //                 decoration: const InputDecoration(
              //                     border: InputBorder.none,
              //                     fillColor: Colors.pinkAccent,
              //                     hintText: 'Your email ID',
              //                     hintStyle: TextStyle(
              //                       fontFamily:"Heading1",
              //                       color:Colors.black,
              //                     )
              //                 ),
              //               ),
              //             ),
              //           ),
              //           SizedBox(height: 40,),
              //           Text("Channel Link",style:TextStyle(
              //             fontFamily:"Heading1",
              //             color:Colors.red,
              //             fontSize: 28,
              //           )),
              //           SizedBox(height: 10,),
              //           Container(
              //             decoration: BoxDecoration(
              //                 color: Colors.pink[400],
              //                 borderRadius: BorderRadius.all(Radius.circular(10))
              //             ),
              //             height:50,
              //             width: 450,
              //             child: Form(
              //               key: key2,
              //               child: TextFormField(
              //                 validator: (val){
              //                   if (val =="" || val == null){
              //                     return "This field is necessary";
              //                   }
              //                   return null;
              //                 },
              //                 style: TextStyle(
              //                     fontFamily:"Heading1",
              //                     color:Colors.white,
              //                     fontSize: 24
              //                 ),
              //                 keyboardType: TextInputType.text,
              //                 onChanged: (text) {
              //                   channel = text;
              //                 },
              //                 decoration: const InputDecoration(
              //                     border: InputBorder.none,
              //                     fillColor: Colors.pinkAccent,
              //                     hintText: 'Your content platform link',
              //                     hintStyle: TextStyle(
              //                       fontFamily:"Heading1",
              //                       color:Colors.black,
              //                       fontStyle: FontStyle.italic,
              //                     )
              //                 ),
              //               ),
              //             ),
              //           ),
              //           SizedBox(height:40),
              //           Text("Socials",style:TextStyle(
              //             fontFamily:"Heading1",
              //             color:Colors.red,
              //             fontSize: 28,
              //           )),
              //           SizedBox(height:10),
              //           Container(
              //             decoration: BoxDecoration(
              //                 color: Colors.pink[400],
              //                 borderRadius: BorderRadius.all(Radius.circular(10))
              //             ),
              //             height:50,
              //             width: 500,
              //             child: Form(
              //               key: key3,
              //               child: TextFormField(
              //                 validator: (val){
              //                   if (val =="" || val == null){
              //                     return "This field is necessary";
              //                   }
              //                   return null;
              //                 },
              //                 style: TextStyle(
              //                     color:Colors.white,
              //                     fontSize: 24,
              //                   fontFamily:"Heading1",
              //                 ),
              //                 maxLines: null,
              //                 keyboardType: TextInputType.multiline,
              //                 onChanged: (text) {
              //                   socials = text;
              //                 },
              //                 decoration: const InputDecoration(
              //                     border: InputBorder.none,
              //                     fillColor: Colors.pinkAccent,
              //                     hintText: 'Your insta/twitter/discord/facebook',
              //                     hintStyle: TextStyle(
              //                       color:Colors.black,
              //                       fontFamily:"Heading1",
              //                     )
              //                 ),
              //               ),
              //             ),
              //           ),
              //           SizedBox(height: 40,),
              //           Center(
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.all(Radius.circular(13))
              //               ),
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: FlatButton(
              //                   color: Colors.white,
              //                   child: Text("Submit",style: TextStyle(
              //                     color: Colors.black,
              //                     fontSize: 20,
              //                     fontWeight: FontWeight.bold,
              //
              //                   ),),
              //                   onPressed: (){
              //                     if (key1.currentState.validate() &&key2.currentState.validate() &&key3.currentState.validate() ) {
              //                       Firestore.instance
              //                         .collection('NewCreator')
              //                         .add({
              //                       "Email": mail,
              //                       "Channel": channel,
              //                       "Socials":socials
              //                     });
              //                     }
              //                   },
              //                 ),
              //               ),
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.yellow,
                          blurRadius: 10.0,
                          spreadRadius: 4.0,

                        ),
                      ]
                  ),
                  width:isLaptop(context)?uniWidth(context)*0.55:uniWidth(context) * 0.9,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "JOIN US",
                            style: TextStyle(
                              fontSize: 28,
                              letterSpacing: 3,
                              fontFamily: "Nimble",
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: 30,
                            child: Divider(
                              color: kPrimaryColorDark,
                              thickness: 2,
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),

                          TextField(
                            controller: emailController,
                            style: GoogleFonts.secularOneTextTheme().bodyText1.merge(TextStyle(color:Colors.white)),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              // hintText: 'Email',
                              // hintStyle: TextStyle(
                              //   color: Colors.white
                              // ),
                              labelText: 'Email',
                              suffixIcon: Icon(
                                Icons.mail_outline,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          TextField(
                            controller: channelController,
                            style: GoogleFonts.secularOneTextTheme().bodyText1.merge(TextStyle(color:Colors.white)),
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              // hintText: 'Password',
                              // hintStyle: TextStyle(
                              //     color: Colors.white
                              // ),
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              labelText: 'Channel Link',
                              suffixIcon: InkWell(
                                child: FaIcon(
                                  FontAwesomeIcons.gamepad,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          TextField(
                            controller: socialsController,
                            style: GoogleFonts.secularOneTextTheme().bodyText1.merge(TextStyle(color:Colors.white)),
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              // hintText: 'Password',
                              // hintStyle: TextStyle(
                              //     color: Colors.white
                              // ),
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              labelText: 'Socials',
                              suffixIcon: InkWell(
                                child: FaIcon(
                                  FontAwesomeIcons.headphones,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 64,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: isLaptop(context)?120:0,),
                            child: actionButtonDark("Submit",(){

                            }
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Footer(context)
            ],
          ),
        ),
      ),
      ),

    );
  }
  void setData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      email = sharedPreferences.getString("email")??"This will be empty";
      emailController.text = email;
    });
  }
}
