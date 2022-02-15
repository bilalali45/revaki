import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revaki/constants/assests_image.dart';
import 'package:revaki/widgets/Alldataset.dart';
import 'package:revaki/widgets/BottomNavBarWidget.dart';
import 'package:revaki/widgets/PopularFoodsWidget.dart';
import 'package:revaki/widgets/SearchWidget.dart';
import 'package:revaki/widgets/TopMenus.dart';
import 'package:revaki/model/dishmodel.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

var contxt;

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  Dio _dio = Dio();
  Response? response;
  Response? categoryresponse;
  dishmodel? _dishModel;
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
    _tabController = TabController(initialIndex: 1, vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    contxt = context;
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Container(
          color: Colors.white,
            // decoration: new BoxDecoration(
            //     image: new DecorationImage(
            //   image: new AssetImage(background),
            //   fit: BoxFit.cover,
            // )),
            child: Scaffold(
                key: _key,
                backgroundColor: Colors.transparent,
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: const <Widget>[
                      DrawerHeader(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(195, 167, 142,1),
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
                  backgroundColor: Color.fromRGBO(195, 167, 142,1),
                   title: Text("Home"),
                  leading: new IconButton(
                  icon: new Icon(Icons.menu),
                  onPressed: () => _key.currentState!.openDrawer(),
        ),
    ),


              body: SingleChildScrollView(


                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     //SearchWidget(),
                //      TopMenus(),
                //       _dishModel != null  ?
                //       PopularFoodsWidget(_dishModel?.DishList):CircularProgressIndicator(),
                //    // BestFoodWidget(),
                //   ],
                // ),

          child: Container(
              child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                  children: <Widget>[
                  Container(
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey)
                      ),

              child: BottomAppBar(
                  child: Container(
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        isScrollable: false,
                        indicator: BoxDecoration(
                          color: Colors.red,
                        ),
                        tabs: <Widget>[
                                   Padding(
                                     padding: const EdgeInsets.all(10.0),
                                     child: Text('1st Floor', style: TextStyle(fontSize: 20,color: Colors.black)),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(10.0),
                                     child: Text('Delivery', style: TextStyle(fontSize: 20,color: Colors.black)),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(10.0),
                                     child: Text('Take Away', style: TextStyle(fontSize: 20,color: Colors.black)),
                                   ),
                        ],
                        controller: _tabController,
                      ),


                  ),


              ),

                      // child: Row(
                      //        children: <Widget>[
                      //          Padding(
                      //            padding: const EdgeInsets.all(10.0),
                      //            child: Text('1st Floor', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      //          ),
                      //          Padding(
                      //            padding: const EdgeInsets.all(10.0),
                      //            child: Text('Delivery', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                      //          ),
                      //          Padding(
                      //            padding: const EdgeInsets.all(10.0),
                      //            child: Text('Take Away', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                      //          ),
                      //
                      //      ]
                      // )
                   ),

                    // Container(
                    //   child: TabBarView(
                    //     controller: _tabController,
                    //     children: [
                    //       Container(
                    //         color: Colors.red,
                    //       ),
                    //       Container(
                    //         color: Colors.orange,
                    //       ),
                    //     ],
                    //   ),
                    //
                    //
                    // ),


                    Container(
                          child: Row(
                            children: <Widget>[
                              Positioned(
                                child: Container(
                                     height: MediaQuery.of(context).size.height,
                                     width: 600.0,
                                     color: Colors.white,
                                     child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            // Container(
                                            //   padding: const EdgeInsets.all(3.0),
                                            //   decoration: BoxDecoration(
                                            //       border: Border.all(color: Colors.grey)
                                            //   ),
                                            //  child:Padding(
                                            //     padding: const EdgeInsets.fromLTRB(10.0,10.0,10.0,18.0),
                                            //     child: Text('Back', style: TextStyle(fontSize: 15)),
                                            //   ),
                                            // ),
                                            Container(
                                                padding: const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.grey)
                                                ),

                                                width:300.0,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(0.0),
                                                  child: DropdownButton<String>(
                                                    isExpanded: true,
                                                    underline: Container(color: Colors.transparent),
                                                    hint: Text("Take Away"),
                                                    items: <String>['A', 'B', 'C', 'D'].map((String value) {
                                                      return DropdownMenuItem<String>(
                                                        value: value,

                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                    onChanged: (_) {

                                                    },
                                                  ),
                                                )

                                            ),

                                            Container(

                                                width:300.0,

                                                padding: const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.grey)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(0.0),
                                                  child: DropdownButton<String>(
                                                    isExpanded: true,
                                                    underline: Container(color: Colors.transparent),
                                                    hint: Text("New Rcpt"),
                                                    items: <String>['A', 'B', 'C', 'D'].map((String value) {
                                                      return DropdownMenuItem<String>(

                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                    onChanged: (_) {

                                                    },
                                                  ),
                                                )

                                           ),




                                          ]
                                      )


                                ),),
                              Positioned(
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)
                                    ),
                                    height: MediaQuery.of(context).size.height,
                                    width:  670.0,
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            TopMenus(),
                                            SearchWidget(),
                                          _dishModel != null  ?
                                          PopularFoodsWidget(_dishModel?.DishList):CircularProgressIndicator(),
                                        ]
                                    )
                                ),),



                            ],
                          ),
                        )
                    ]
                   )

                  )



             ]
              )
           )

              ),
            ///  bottomNavigationBar: BottomNavBarWidget(),
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
      "Token":"4070D5B30D09D9B89B5ADBB23073ACD9"
    };
    response = await _dio.post("http://revaki.posapi.com.asp1-101.phx1-1.websitetestlink.com/api/RevakiPOSAPI/dishlist",data: jsonEncode(mapData));

    //print("Response222:"+response!.data!.toString());
    _dishModel = dishmodel.fromJson(response?.data);

    //log("Print"+_dishModel?.DishList![0].toString())

    setState(() {

    });

  }



}
