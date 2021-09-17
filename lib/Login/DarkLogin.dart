import 'package:flutter/material.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xspectre/Home.dart';

import '../help/Auth.dart';
import '../Styles.dart';
import 'action_button_dark.dart';
import 'darkDialog.dart';

class LogInDark extends StatefulWidget {
  final Function onSignUpSelected;

  LogInDark({@required this.onSignUpSelected});

  @override
  _LogInDarkState createState() => _LogInDarkState();
}

class _LogInDarkState extends State<LogInDark> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _showPassword = true;
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isLoading = false;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(size.height > 770
              ? 64
              : size.height > 670
                  ? 32
                  : 16),
          child: Center(
            child: Card(
              elevation: 4,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.all(
              //     Radius.circular(25),
              //   ),
              // ),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: size.height *
                    (size.height > 770
                        ? 0.7
                        : size.height > 670
                            ? 0.8
                            : 0.9),
                width: 500,
                // color: Colors.white,
                color: Color.fromRGBO(9, 14, 28, 0.8),

                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "LOG IN",
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
                            obscureText: _showPassword,
                            controller: passwordController,
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
                              labelText: 'Password',
                              suffixIcon: InkWell(
                                onTap: _togglePasswordVisibility,
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 64,
                          ),
                          actionButtonDark("Log In",(){
                            FirebaseAuthService.emailLogIn(emailController.text, passwordController.text, context, darkDialog((){},context));
                          }
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          SignInButton(
                            Buttons.GoogleDark,
                            onPressed: () async{
                              setState((){
                                isLoading = true;
                              });
                              bool user = await FirebaseAuthService.signIn();
                              if (user){
                                Fluttertoast.showToast(
                                  msg: "Sign In Success",
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor:Colors.black,
                                  textColor:kPrimaryColorDark,
                                );
                                Navigator.of(context).pushNamed(Home.route);
                              }
                              else{
                                Fluttertoast.showToast(
                                  msg: "There was an error signing in",
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor:Colors.black,
                                  textColor:kPrimaryColorDark,
                                );
                              }
                              setState((){
                                isLoading = false;
                              });

                            },
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "You do not have an account?",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                onTap: () {
                                  widget.onSignUpSelected();
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: kPrimaryColorDark,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: kPrimaryColorDark,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child:isLoading?CircularProgressIndicator.adaptive():Container()
        )
      ],
    );
  }
  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
      // passwordController.value = TextEditingValue(text: password);
      // emailController.value = TextEditingValue(text: email);
    });
  }
}
