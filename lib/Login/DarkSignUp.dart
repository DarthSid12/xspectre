import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xspectre/Home.dart';

import '../help/Auth.dart';
import '../Styles.dart';
import 'action_button_dark.dart';
import 'darkDialog.dart';

class SignUpDark extends StatefulWidget {
  final Function onLogInSelected;

  SignUpDark({@required this.onLogInSelected});

  @override
  _SignUpDarkState createState() => _SignUpDarkState();
}

class _SignUpDarkState extends State<SignUpDark> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nicknameController = TextEditingController();
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
                //color: Colors.white,
                color: Color.fromRGBO(9, 14, 28, 0.8),
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "SIGN UP",
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
                            style: GoogleFonts.secularOneTextTheme().bodyText1.merge(TextStyle(color:Colors.white)),
                            controller: nicknameController,
                            decoration: InputDecoration(
                              // hintText: 'Name',
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              suffixIcon: Icon(
                                Icons.person_outline,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          TextField(
                            style: GoogleFonts.secularOneTextTheme().bodyText1.merge(TextStyle(color:Colors.white)),
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              // hintText: 'Email',
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
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
                            style: GoogleFonts.secularOneTextTheme().bodyText1.merge(TextStyle(color:Colors.white)),
                            controller: passwordController,
                            decoration: InputDecoration(
                              // hintText: 'Password',
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              suffixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 64,
                          ),
                          actionButtonDark("Create Account",(){
                            FirebaseAuthService.emailSignUp(nicknameController.text,emailController.text, passwordController.text, context, darkDialog(widget.onLogInSelected,context));
                          }),
                          SizedBox(
                            height: 22,
                          ),
                          SignInButton(
                            Buttons.GoogleDark,
                            onPressed: ()  async{
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
                                Navigator.pushReplacement(context,MaterialPageRoute( builder: (context)=>Home()));
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
                            height: 22,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
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
                                  widget.onLogInSelected();
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Log In",
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
            child:isLoading?CircularProgressIndicator():Container()
        )
      ],
    );
  }
}
