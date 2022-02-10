

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revaki/constants/assests_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
var contxt;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    contxt = context;
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: () => Future.value(false),
       child: Container(
        decoration:new BoxDecoration(
            image:  new DecorationImage(
              image: new AssetImage(background),
              fit: BoxFit.cover,)
        ),
        child : Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
                height: height,
                child: Stack(
                    children: [


                    ]
                )
            )
        )
      )
    );
  }

}