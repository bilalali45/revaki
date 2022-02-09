import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revaki/Screens/LoginPage.dart';

import '../constants/assests_image.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => LoginPage())));

    return MaterialApp(
     title: "MoonLight",
      home: Container(
        decoration:new BoxDecoration(
            image:  new DecorationImage(
              image: new AssetImage(background),
              fit: BoxFit.cover,)
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
        ),
      ),


     );
   }

}