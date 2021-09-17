import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:xspectre/Tournament.dart';
import 'help/configure_nonweb.dart' if (dart.library.html) 'help/configure_web.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xspectre/Home.dart';
import 'package:xspectre/Login/Login.dart';
import 'package:xspectre/Squad.dart';

import 'AddVideos.dart';
import 'Community.dart';
import 'Forum.dart';
import 'JoinUs.dart';
import 'Profile.dart';
import 'T&C.dart';
import 'Videos.dart';
import 'Tournament.dart';


void main() {
  configureApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  PageTransitionType transitionType = PageTransitionType.rotate;
  @override
  Widget build(BuildContext context) {
    // setMock();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: Home.route,
        routes:  {
          Home.route: (context) => Home(),
          VideoPage.route: (context) => VideoPage(),
          AddVideos.route: (context) => AddVideos(),
          Community.route: (context) => Community(),
          JoinUs.route: (context) => JoinUs(),
          Profile.route: (context) => Profile(),
          Squad.route: (context) => Squad(),
          Terms.route: (context) => Terms(),
          Login.route: (context) => Login(),
          Tournaments.route:(context) => Tournaments(),
        },
      onGenerateRoute: (settings){
        switch (settings.name){
          case Home.route:
            return PageTransition(
              child:Home(),
              type: transitionType,
              settings: settings,
            );
          case VideoPage.route:
            return PageTransition(
              child:VideoPage(),
              type: transitionType,
              settings: settings,
            );
          case Community.route:
            return PageTransition(
              child:Community(),
              type: transitionType,
              settings: settings,
            );
          case AddVideos.route:
            return PageTransition(
              child:AddVideos(),
              type: transitionType,
              settings: settings,
            );
          case JoinUs.route:
            return PageTransition(
              child:JoinUs(),
              type: transitionType,
              settings: settings,
            );
          case Profile.route:
            return PageTransition(
              child:Profile(),
              type: transitionType,
              settings: settings,
            );
          case Squad.route:
            return PageTransition(
              child:Squad(),
              type: transitionType,
              settings: settings,
            );
          case Terms.route:
            return PageTransition(
              child:Terms(),
              type: transitionType,
              settings: settings,
            );
          case Login.route:
            return PageTransition(
              child:Login(),
              type: transitionType,
              settings: settings,
            );
          default:
            return PageTransition(
              child:Home(),
              type: transitionType,
              settings: settings,
            );
        }
      },
    );
  }
  void setMock() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('id', "3sMtwaSgu2VWRYs4PrzzQSASVFz2");
    await prefs.setString('nickname', "Siddharth Agrawal");
    print("Hello");
    await prefs.setString('photoUrl', "");
  }
}
