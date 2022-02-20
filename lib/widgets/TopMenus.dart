import 'package:flutter/material.dart';
import 'package:revaki/constants/assests_image.dart';
import 'package:revaki/model/SomeRootEntityFoodCategories.dart';

class TopMenus extends StatefulWidget {
  SomeRootEntity? callist;
  final TabController _tabControllertw0;

  TopMenus(this.callist, this._tabControllertw0);
  @override
  _TopMenusState createState() => _TopMenusState();
}

class _TopMenusState extends State<TopMenus> {


  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TopMenus oldWidget) {
    super.didUpdateWidget(oldWidget);
   // _tabController = TabController(initialIndex: 1, vsync: this, length: widget.callist?.FoodCategories.length??0);
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
      ),
      height: 60,
      width: double.infinity,
      alignment: Alignment.center,
      child: TabBar(
        controller:widget._tabControllertw0,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: false,
          indicator: BoxDecoration(
            color: Colors.red,
          ),
          tabs:  widget.callist?.FoodCategories.map<Widget>((item) {
            return  Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(item.CategoryName,
                  style: TextStyle(
                      fontSize: 20, color: Colors.black)),
            );
          }).toList()??[]
      ),
    );
  }
}

class TopMenuTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String slug;

  TopMenuTiles(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            decoration: new BoxDecoration(boxShadow: [

            ]),
            child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(3.0),
                  ),
                ),
                child:Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:Text(name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),)

            ),
          ),

        ],
      ),
    );
  }
}
