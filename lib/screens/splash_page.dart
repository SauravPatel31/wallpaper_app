import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/screens/home/home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
  return _SplashPageState();
  }

}
class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage(),));
    });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Image.asset("assets/images/splash_view.gif",width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,fit: BoxFit.cover,),
   );
  }

}