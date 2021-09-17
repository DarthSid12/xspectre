import 'package:flutter/cupertino.dart';

bool isLaptop(context){
  if(MediaQuery.of(context).size.width>480)
  {
    return true;
  }
  return false;
}
double uniHeight(context){
  return MediaQuery.of(context).size.height;
}
double uniWidth(context){
  return MediaQuery.of(context).size.width;
}