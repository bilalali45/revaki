import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revaki/constants/assests_image.dart';
import 'package:revaki/widgets/BottomNavBarWidget.dart';
import 'package:revaki/widgets/PopularFoodsWidget.dart';
import 'package:revaki/widgets/SearchWidget.dart';
import 'package:revaki/widgets/TopMenus.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

var contxt;

class _HomePageState extends State<HomePage> {
  Dio _dio = Dio();
  Response? response;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }
  @override
  Widget build(BuildContext context) {
    contxt = context;

    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
              image: new AssetImage(background),
              fit: BoxFit.cover,
            )),
            child: Scaffold(
                key: _key,
                backgroundColor: Colors.transparent,
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: const <Widget>[
                      DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: Text(
                          'Drawer Header',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.message),
                        title: Text('Messages'),
                      ),
                      ListTile(
                        leading: Icon(Icons.account_circle),
                        title: Text('Profile'),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Settings'),
                      ),

                    ],

                  ),

                ),
                appBar: new AppBar(
                   title: Text("Home"),
                  leading: new IconButton(
                  icon: new Icon(Icons.menu),
                  onPressed: () => _key.currentState!.openDrawer(),
        ),
    ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    //SearchWidget(),
                     TopMenus(),
                      PopularFoodsWidget(),
                   // BestFoodWidget(),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavBarWidget(),
            ),


        )

    );
  }



  void _getData() async{
    // FormData _formData;
    // _formData = FormData.fromMap({
    //   "token"
    //   ""
    // });



    Map<String,dynamic?> mapData = {
      "PlaceId":"2bec1011-305d-4324-91ae-34ff8e589764",
      "Token":"E98AB1D527475185DD0D7B35CEFB8D72"
    };
    response = await _dio.post("http://revaki.posapi.com.asp1-101.phx1-1.websitetestlink.com/api/RevakiPOSAPI/dishlist",data: jsonEncode(mapData));

    log("Response:"+response?.data);
  }



}
