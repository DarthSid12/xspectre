import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Home.dart';

class FirebaseAuthService {
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static User currentUser;
  static SharedPreferences prefs;
  static Future<bool> signIn() async {
  prefs = await SharedPreferences.getInstance();
  GoogleSignInAccount googleUser = await googleSignIn.signIn();
  GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  User firebaseUser =
  (await firebaseAuth.signInWithCredential(credential)).user;

  if (firebaseUser != null) {
  // Check is already sign up
  final QuerySnapshot result = await FirebaseFirestore.instance
      .collection('users')
      .where('id', isEqualTo: firebaseUser.uid)
      .get();
  final List<DocumentSnapshot> documents = result.docs;
  if (documents.length == 0) {
  // Update data to server if new user
  FirebaseFirestore.instance.collection('users').add({
  'id': FieldPath.documentId,
  'nickname':firebaseUser.displayName,
  'UID': firebaseUser.uid,
  'email': firebaseUser.email,
  'photo' :firebaseUser.photoURL,
  'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
  });

  // Write data to local
  currentUser = firebaseUser;
  await prefs.setString('id', currentUser.uid);
  await prefs.setString('nickname', currentUser.displayName);
  await prefs.setString('email', currentUser.email);
  await prefs.setString('photo', currentUser.photoURL);
  } else {
  // Write data to local
  await prefs.setString('id', documents[0]['UID']);
  await prefs.setString('nickname', documents[0]['nickname']);
  await prefs.setString('email',  documents[0]['email']);
  await prefs.setString('photo',  documents[0]['photo']);
  }
  return true;
  }
  return false;
}


static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
    prefs = await SharedPreferences.getInstance();
    prefs.clear();
    prefs.commit();

  }
  static Future<void> emailSignUp(String nickname,String email, String password,BuildContext context,Widget dialog) async {
    Function switchToLogin;
    User user;
    try {
      user = (await
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
      ).user;
    }
    catch (e){
      print(e);
      Fluttertoast.showToast(msg:"Your account already exists. Please sign in",);
      return;
    }

    try {
      await user.sendEmailVerification();

      switchToLogin = await showDialog(
          context: context,
          builder: (BuildContext context){
            return dialog;
          }      );
    } catch (e) {
      print("An error occurred while trying to send email verification");
      print(e.message);
      return;
    }
    if (user!=null){
      user.reload();
      if (!user.emailVerified){
        Fluttertoast.showToast(msg: "Your email is not verified. Please try again");
      }
      print("Before");
      FirebaseFirestore.instance.collection('users').add({
        'id': FieldPath.documentId.toString(),
        'nickname':nickname.toString(),
        'UID': user.uid.toString(),
        'email': user.email.toString(),
        'photo' :user.photoURL.toString(),
        'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
      });
      print("after");
      switchToLogin();
    }
  }
  static Future<void> emailLogIn(String email, String password,BuildContext context,Widget dialog) async {
    final User user = (await
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    )
    ).user;
    print(user.emailVerified.toString());
    if (user == null){
      Fluttertoast.showToast(msg: "Your account does not exist. Please sign in");
    }
    else if (!user.emailVerified){
      try {
        user.sendEmailVerification();
        await showDialog(
            context: context,
            builder: (BuildContext context){
              return dialog;
            }
        );
        print("Reloading");
        user.reload();
        print("Reloaded");
      }
      catch (e) {
        print("An error occurred while trying to send email verification");
        print(e.message);
        return;
      }
    }
    else {
      print("Before");
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users').where('email',isEqualTo: user.email.toString()).get();
      DocumentSnapshot documents = snapshot.docs[0];
      prefs = await SharedPreferences.getInstance();
      await prefs.setString('nickname', documents['nickname'.toString()].toString());
      await prefs.setString('id', documents['UID'.toString()].toString());
      await prefs.setString('email',  documents['email'.toString()].toString());
      await prefs.setString('photo',  documents['photo'].toString());
      Navigator.of(context).pushNamed(Home.route);
    }


  }

}