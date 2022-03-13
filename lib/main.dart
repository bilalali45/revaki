import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:revaki/Screens/SplashScreen.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  SplashScreen(),
    );
  }
}


//
// static String serviceURL = "http://revaki.posapi.com.asp1-101.phx1-1.websitetestlink.com";
//
// objreq.put("PlaceId", PlaceId);
// objreq.put("Token", getToken());


  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     //
  //     // home: SplashScreen(),
  //   );
  // }



