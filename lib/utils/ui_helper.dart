import 'package:flutter/material.dart';

class AppColors{
  static final primaryColor=Color(0xffDEEBF3);
  static final secondryColor=Color(0xffEEF3F5);
  static final mainColor=Color(0xff3F64F5);

}
TextStyle mytextstyle24({Color textcolor=Colors.black,FontWeight myFontWeight=FontWeight.normal}){
  return TextStyle(
      fontSize: 30,
      color: textcolor,
      fontWeight: myFontWeight,
      fontFamily:'Mons'
  );
}
TextStyle mytextstyle20({Color textcolor=Colors.black,FontWeight myFontWeight=FontWeight.normal}){
  return TextStyle(
      fontSize: 20,
      color: textcolor,
      fontWeight: myFontWeight,
      fontFamily:'Mons'
  );
}
TextStyle mytextstyle12({Color textcolor=Colors.black,FontWeight myFontWeight=FontWeight.normal}){
  return TextStyle(
      fontSize: 12,
      fontFamily:'Mons',
      color: textcolor,
      fontWeight: myFontWeight
  );
}
TextStyle mytextstyle16({Color textcolor=Colors.black,FontWeight myFontWeight=FontWeight.normal}){
  return TextStyle(
      fontSize: 16,
      fontFamily:'Mons',
      color: textcolor,
      fontWeight: myFontWeight
  );
}