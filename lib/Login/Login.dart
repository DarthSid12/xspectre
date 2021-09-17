import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xspectre/help/IsPhone.dart';

import '../Styles.dart';
import 'DarkLogin.dart';
import 'DarkSignUp.dart';

class Login extends StatefulWidget {
  static const String route = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Option selectedOption = Option.LogIn;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    print(size.height);
    print(size.width);

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: double.infinity,
                  width: size.width / 2,
                  color: kPrimaryColorDark,
                ),
                Container(
                  height: double.infinity,
                  width: size.width / 2,
                  color: Color.fromRGBO(9, 14, 28, 0.8),
                ),
              ],
            ),
            AnimatedCrossFade(
              duration: Duration(milliseconds:400),
              crossFadeState:  uniWidth(context)>980?CrossFadeState.showFirst:CrossFadeState.showSecond,
              firstChild: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Text(
                    "Xspectre",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              secondChild: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "X ",
                        style: GoogleFonts.secularOneTextTheme().headline1.merge(TextStyle(color:Colors.white)),
                      ),
                      Text(
                        "Spectre",
                        style: TextStyle(
                          color: kPrimaryColorDark,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedCrossFade(
              duration: Duration(milliseconds: 400),
              secondChild: Align(
                  alignment: Alignment.centerLeft,
                  child: Container()
              ),
              crossFadeState:  uniWidth(context)>920?CrossFadeState.showFirst:CrossFadeState.showSecond,
              firstChild:Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Get Started!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //TODO:Ask Abhi Bhaiya about this text
                      Text(
                        "Login to begin exploring !",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            AnimatedCrossFade(
              duration: Duration(milliseconds: 400),
              secondChild: Align(
                  alignment: Alignment.bottomRight,
                  child: Container()
              ),
              crossFadeState:  uniWidth(context)>920?CrossFadeState.showFirst:CrossFadeState.showSecond,
              firstChild: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.copyright,
                        color: Colors.grey,
                        size: 24,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "XSPECTRE Copyright 2021",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(seconds: 1),

              //Animation 1
              transitionBuilder: (widget, animation) => RotationTransition(
                turns: animation,
                child: widget,
              ),
              switchOutCurve: Curves.easeInOutCubic,
              switchInCurve: Curves.fastLinearToSlowEaseIn,

              //Animation 2
              // transitionBuilder: (widget, animation) =>
              //     ScaleTransition(child: widget, scale: animation),

              child: Padding(
                padding:  EdgeInsets.fromLTRB(0,paddingHeight(),0,0),
                child: selectedOption == Option.LogIn
                    ? LogInDark(
                  onSignUpSelected: () {
                    setState(() {
                      selectedOption = Option.SignUp;
                    });
                  },
                )
                    : SignUpDark(
                  onLogInSelected: () {
                    setState(() {
                      selectedOption = Option.LogIn;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  double paddingHeight(){
    double f =uniWidth(context)>980?  0: 60;
    return f;
  }
}

