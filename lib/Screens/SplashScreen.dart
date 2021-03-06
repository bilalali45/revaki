import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:revaki/controller/my_controller.dart';
import 'package:revaki/model/Usermodel.dart';
import '../constants/assests_image.dart';
import 'package:revaki/Screens/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomePage.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}
class _SplashScreen extends State<SplashScreen> with TickerProviderStateMixin {
  MyController myController = Get.put(MyController());

  @override
  void initState() {
    super.initState();
    _getData(context);

}
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
            () =>
            _getData(context)
    );

    return MaterialApp(
      title: "MoonLight",
      home: Container(

        decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(background),
              fit: BoxFit.cover,)
        ),
           child: Column(

            children:  <Widget>[
              Spacer(),

              // 1st spacer
              Align(
                alignment: Alignment.center,
                // Align however you like (i.e .centerRight, centerLeft)
                child: Text("Revaki", style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
              ),
              Align(
                alignment: Alignment.center,
                // Align however you like (i.e .centerRight, centerLeft)
                child: Text("POS", style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
              ),
              Spacer(),

              // Expanded(
              //
              // // child: ItemAddlist(_dishModel?.DishList),
              // child:
              //
              // Obx(() {
              //   return Container(
              //     tabControllerview = TabController(initialIndex: 0, vsync: this, length: 10);
              //      );
              //   }
              //     )
              // )
            ]

        ),


      ),


    );
  }


  void _getData(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();



    var statuslogin = pref.getBool(SharedLoginstatus);

    if (statuslogin == true) {
      // var json = pref.getString('userData')!.toString();
      // Map<String, dynamic> data = jsonDecode(json);
      // print("Response222:" + json.toString());
      // var user = Usermodel.fromJson(data);

      var  login = GetStorage().read('currenuserdata');
      print(statuslogin);
      myController.fetchdata();

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => HomePage()));



    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => LoginPage()));
    }
  }
}