import 'package:flutter/material.dart';

import '../Styles.dart';
import 'action_button_dark.dart';

SimpleDialog darkDialog(Function switchToLogin,BuildContext context){
  return SimpleDialog(
    children: [
      Container(
        color: Colors.black,
        margin: EdgeInsets.all(0.0),
        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
        height: 70.0,
        child: Column(
          children: <Widget>[
            Container(
              child: Icon(
                Icons.mail,
                size: 30.0,
                color: kPrimaryColorDark,
              ),
              margin: EdgeInsets.only(bottom: 10.0),
            ),

          ],
        ),
      ),
      Container(
          height:200,
          color:kPrimaryColorDark,
          child:Stack(
            children: [
              Center(
                  child: Flexible(
                    child: Text("Please verify your email through the link sent there",
                      maxLines: null,),
                  )
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child:Padding(
                      padding:EdgeInsets.fromLTRB(0,0,0,15),
                      child:actionButtonDark("Next",(){
                        Navigator.pop(context,switchToLogin);
                      },)
                  )
              )
            ],
          )
      )
    ],
  );
}