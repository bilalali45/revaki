import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/assests_image.dart';
import 'package:revaki/Screens/LoginPage.dart';

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
                 child: Column(

                     children: const <Widget>[
                       Spacer(), // 1st spacer
                       Align(
                         alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                         child: Text("Revaki", style: TextStyle(
                             fontSize: 40.0,
                             color: Colors.black,
                             fontWeight: FontWeight.bold)),
                       ),
                       Align(
                         alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                         child: Text("POS",style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.black,
                             fontWeight: FontWeight.bold)),
                        ),
                       Spacer(),

                      ]

                ),



      ),


    );
   }

}