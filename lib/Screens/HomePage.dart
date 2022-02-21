import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revaki/constants/assests_image.dart';
import 'package:revaki/model/SomeRootEntityFoodCategories.dart';
import 'package:revaki/widgets/Alldataset.dart';
import 'package:revaki/widgets/BottomNavBarWidget.dart';
import 'package:revaki/widgets/ItemAddlist.dart';
import 'package:revaki/widgets/PopularFoodsWidget.dart';
import 'package:revaki/widgets/SearchWidget.dart';
import 'package:revaki/widgets/TopMenus.dart';
import 'package:revaki/model/dishmodel.dart';

class HomePage extends StatefulWidget {

  @override
  // TODO: implement key
  Key? key = homekey;

   HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
final GlobalKey<_HomePageState> homekey= GlobalKey();
var contxt;
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Dio _dio = Dio();
  Response? response;
  Response? responsecat;
  Response? categoryresponse;
  dishmodel? _dishModel;
 // SomeRootEntityFoodCategories? _catModel;
  SomeRootEntity? _catModel;
  late TabController _tabController;
  late TabController _tabControllertwo;
  @override
  void initState() {
    super.initState();
    _getData();
    _tabController = TabController(initialIndex: 0, vsync: this, length: 3);
  //  _tabControllertwo = TabController(initialIndex: 0, vsync: this, length: _catModel?.FoodCategories.length??0);
  }
  
  

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabControllertwo = TabController(initialIndex: 0, vsync: this, length: _catModel?.FoodCategories.length??0);
    contxt = context;
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Container(
          color: Colors.white,
           child: Scaffold(
               key: _key,
               backgroundColor: Colors.transparent,
               drawer: Drawer(
                 child: ListView(
                    padding: EdgeInsets.zero,
                    children: const <Widget>[
                      DrawerHeader(
                         decoration: BoxDecoration(
                         color: Color.fromRGBO(195, 167, 142, 1),
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
                 backgroundColor: Color.fromRGBO(195, 167, 142, 1),
                 title: Text("Home"),
                 leading: new IconButton(
                 icon: new Icon(Icons.menu),
                 onPressed: () => _key.currentState!.openDrawer(),
              ),
            ),
               body:Container(
                   width: MediaQuery.of(context).size.width,
                   child: Column(children: <Widget>[
                     Container(
                       padding: const EdgeInsets.all(3.0),
                       decoration: BoxDecoration(
                           border: Border.all(color: Colors.grey)),
                       child: BottomAppBar(
                         child: Container(
                             alignment: Alignment.bottomLeft,
                             child: Column(
                                 children: <Widget>[
                                   Container(
                                     width: 600,
                                     child: TabBar(
                                       indicatorSize: TabBarIndicatorSize.label,
                                       isScrollable: false,
                                       indicator: BoxDecoration(
                                         color: Colors.red,
                                       ),
                                       tabs: <Widget>[
                                         Padding(
                                           padding: const EdgeInsets.all(10.0),
                                           child: Text('1st Floor',
                                               style: TextStyle(
                                                   fontSize: 20, color: Colors.black)),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.all(10.0),
                                           child: Text('Delivery',
                                               style: TextStyle(
                                                   fontSize: 20, color: Colors.black)),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.all(10.0),
                                           child: Text('Take Away',
                                               style: TextStyle(
                                                   fontSize: 20, color: Colors.black)),
                                         ),
                                       ],
                                       controller: _tabController,
                                     ),
                                   ),
                                 ]
                             )
                         ),
                       ),
                     ),
                     Expanded(
                       child: Container(
                         child: Row(
                           children: <Widget>[
                             ///PopularListItemstitle(),
                             Expanded(
                               child: Container(
                                 //  height: MediaQuery.of(context).size.height,
                                  // width: MediaQuery.of(context).size.width,
                                   color: Colors.white,
                                   child: Column(
                                       children: <Widget>[
                                         new Container(
                                             child: Row(
                                                 crossAxisAlignment:
                                                 CrossAxisAlignment.start,
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

                                                   Expanded(child : Container(
                                                       padding:
                                                       const EdgeInsets.all(3.0),
                                                       decoration: BoxDecoration(
                                                           border: Border.all(
                                                               color: Colors.grey)),
                                                       width: 300.0,
                                                       child: Padding(
                                                         padding:
                                                         const EdgeInsets.all(0.0),
                                                         child: DropdownButton<String>(
                                                           isExpanded: true,
                                                           underline: Container(
                                                               color:
                                                               Colors.transparent),
                                                           hint: Text("Take Away"),
                                                           items: <String>[
                                                             'A',
                                                             'B',
                                                             'C',
                                                             'D'
                                                           ].map((String value) {
                                                             return DropdownMenuItem<
                                                                 String>(
                                                               value: value,
                                                               child: Text(value),
                                                             );
                                                           }).toList(),
                                                           onChanged: (_) {},
                                                         ),
                                                       ))
                                                   ),
                                                   Expanded(child :
                                                   Container(
                                                       width: 300.0,
                                                       padding:
                                                       const EdgeInsets.all(3.0),
                                                       decoration: BoxDecoration(
                                                           border: Border.all(
                                                               color: Colors.grey)),
                                                       child: Padding(
                                                         padding:
                                                         const EdgeInsets.all(0.0),
                                                         child: DropdownButton<String>(
                                                           isExpanded: true,
                                                           underline: Container(
                                                               color:
                                                               Colors.transparent),
                                                           hint: Text("New Rcpt"),
                                                           items: <String>[
                                                             'A',
                                                             'B',
                                                             'C',
                                                             'D'
                                                           ].map((String value) {
                                                             return DropdownMenuItem<
                                                                 String>(
                                                               value: value,
                                                               child: Text(value),
                                                             );
                                                           }).toList(),
                                                           onChanged: (_) {

                                                           },
                                                         ),
                                                       )),
                                                   )
                                                 ])
                                         ),

                                         Expanded(
                                          // child: ItemAddlist(_dishModel?.DishList),
                                           child: TabBarView(controller: _tabController,children: [
                                             new Container(
                                                 child: Column(
                                                     children: <Widget>[
                                                       Expanded(child: ItemAddlist(),)
                                                       // _dishModel != null ? ItemAddlist(_dishModel?.DishList) : CircularProgressIndicator(),
                                                     ]
                                                 )
                                             ),
                                             Container(),Container(),
                                           ],),



                                         ),
                                       ]


                                   )),

                             ),
                             Expanded(
                               child: Container(
                                   decoration: BoxDecoration(
                                       border: Border.all(color: Colors.grey)),
                                 //  height: MediaQuery.of(context).size.height,
                                 //  width: MediaQuery.of(context).size.width,
                                   child: Column(
                                       mainAxisAlignment:
                                       MainAxisAlignment.center,
                                       children: <Widget>[
                                         Builder(builder:(con){

                                           return TopMenus(_catModel,_tabControllertwo);
                                         }),
                                         SearchWidget(),
                                         //_dishModel != null ? PopularFoodsWidget(_dishModel?.DishList) : CircularProgressIndicator(),
                                         //Expanded(child: Container(color: Colors.red,width: 100,))

                                         Expanded(
                                           // child: ItemAddlist(_dishModel?.DishList),
                                           child: TabBarView(controller: _tabControllertwo,children: _catModel?.FoodCategories.map<Widget>((item){
                                             return PopularFoodsWidget(_dishModel?.DishList,key: UniqueKey(),);
                                           }).toList()??[],),



                                         )
                                       //  Expanded(child: PopularFoodsWidget(_dishModel?.DishList))

                                       ])),

                             )




                           ],
                         ),
                       ),
                     )
                   ]))
               ),
             ///  bottomNavigationBar: BottomNavBarWidget(),
          ),
        );
  }




  void _getData() async {
    // FormData _formData;
    // _formData = FormData.fromMap({
    //   "token"
    //   ""
    // });
      Map<String, dynamic?> mapData = {
        "PlaceId": "2bec1011-305d-4324-91ae-34ff8e589764",
        "Token": "35694B50B4730AAF2A10D8FE8F86B015"
      };
       response = await _dio.post(
       "http://revaki.posapi.com.asp1-101.phx1-1.websitetestlink.com/api/RevakiPOSAPI/dishlist",
        data: jsonEncode(mapData));
       responsecat = await _dio.post(
          "http://revaki.posapi.com.asp1-101.phx1-1.websitetestlink.com/api/RevakiPOSAPI/foodcategorieslist",
          data: jsonEncode(mapData));
      //print("Response222:"+response!.data!.toString());
       _dishModel = dishmodel.fromJson(response?.data);
       _catModel = SomeRootEntity.fromJson(responsecat?.data);
      print("Response222:"+response!.data!.toString());
      print("Responsecat:"+responsecat!.data!.toString());
       setState(() {});
  }

/*  tyu: 2bec1011-305d-4324-91ae-34ff8e589764
  tyy: 84DEA70E4F1D39F9E777040B17D9CC34*/

}
