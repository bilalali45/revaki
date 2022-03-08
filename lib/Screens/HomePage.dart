import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revaki/Screens/LoginPage.dart';
import 'package:revaki/constants/assests_image.dart';
import 'package:revaki/model/SomeRootEntityFoodCategories.dart';
import 'package:revaki/model/Usermodel.dart';
import 'package:revaki/widgets/Alldataset.dart';
import 'package:revaki/widgets/BottomNavBarWidget.dart';
import 'package:revaki/widgets/ItemAddlist.dart';
import 'package:revaki/widgets/PopularFoodsWidget.dart';
import 'package:revaki/widgets/SearchWidget.dart';
import 'package:revaki/widgets/TopMenus.dart';
import 'package:revaki/model/dishmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HomePage extends StatefulWidget {

  @override
  // TODO: implement key
  Key? key = homekey;
  final Usermodel usermodel;

  HomePage(this.usermodel,  {Key? key}) : super(key: key);
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
                    children:  <Widget>[
                      DrawerHeader(
                         decoration: BoxDecoration(
                           color: Color.fromRGBO(195, 167, 142, 1),
                         ),
                        child: Text(
                          'Demo_Admin',
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                    ),
                  ),
                      ListTile(
                        leading: Icon(Icons.message),
                        title: Text('Home'),
                      ),
                      ListTile(
                        leading: Icon(Icons.account_circle),
                        title: Text('Categories'),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Dishes'),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Transaction'),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Shift Summary'),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Shift Register'),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Day Register'),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Void Report'),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Settings'),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Print Test'),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                         title: Text('Print Category Item'),
                      ),
                      ListTile(
                       // leading: Icon(Icons.settings),
                        title: Text("Logout"),
                        leading: GestureDetector(
                          onTap: () {

                            showAlertDialog(context);
                            // Action 1
                          },
                          child: Icon(Icons.shopping_bag)
                        ),
                      //  title: Text('Print Category Item'),


                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text(''),
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
                                       indicator: UnderlineTabIndicator(
                                         borderSide: BorderSide(color: Color(0xff8d8d8d), width: 3.0),

                                       ),
                                       tabs: <Widget>[
                                         Padding(
                                           padding: const EdgeInsets.all(10.0),
                                           child: Text('1st Floor',
                                               style: TextStyle(
                                                   fontSize: 20,fontWeight: FontWeight.w700, color: Color(0xff8d8d8d))),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.all(10.0),
                                           child: Text('Delivery',
                                               style: TextStyle(
                                                   fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xff8d8d8d))),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.all(10.0),
                                           child: Text('Take Away',
                                               style: TextStyle(
                                                   fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xff8d8d8d))),
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
                                             Container( child: Column(
                                                 children: <Widget>[
                                                   Expanded(child: ItemAddlist(),)
                                                   // _dishModel != null ? ItemAddlist(_dishModel?.DishList) : CircularProgressIndicator(),
                                                 ]
                                             )),Container( child: Column(
                                                 children: <Widget>[
                                                   Expanded(child: ItemAddlist(),)
                                                   // _dishModel != null ? ItemAddlist(_dishModel?.DishList) : CircularProgressIndicator(),
                                                 ]
                                             )),
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

  void onTouch(){
    print('Home Clicked');
    Navigator.pop(context);
  }
  Widget _text({void Function()? onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          child:Text(
            "Logout",
          ),
        ));
  }

  void _getData() async {
    // prefs = await SharedPreferences.getInstance();

    // FormData _formData;
    // _formData = FormData.fromMap({
    //   "token"
    //   ""
    // });
      Map<String, dynamic?> mapData = {
        "PlaceId": widget.usermodel!.PlaceId,
        "Token":  widget.usermodel!.Token
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
showAlertDialog(BuildContext context)  {
  // set up the buttons

  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed:  () {

    },
  );
  Widget continueButton = TextButton(
    child: Text("OK"),
    onPressed:  () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Navigator.of(context, rootNavigator: true).pop();
      prefs.setString('userData',"");
      prefs.setBool(SharedLoginstatus, false);

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => LoginPage()));

    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Logout"),
    content: Text("Are You Sure You want to Logout?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}