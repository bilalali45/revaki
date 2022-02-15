import 'package:flutter/material.dart';
import 'package:revaki/constants/assests_image.dart';

class TopMenus extends StatefulWidget {
  @override
  _TopMenusState createState() => _TopMenusState();
}

class _TopMenusState extends State<TopMenus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
      ),
      height: 60,
      width: double.infinity,
      alignment: Alignment.center,
      child: ListView(
        scrollDirection: Axis.horizontal,
          shrinkWrap: true,
        children: <Widget>[
          TopMenuTiles(name: "Burger", imageUrl: d1, slug: ""),
          TopMenuTiles(name: "Sushi", imageUrl:   d1, slug: ""),
          TopMenuTiles(name: "Pizza", imageUrl:   d1, slug: ""),
          TopMenuTiles(name: "Cake", imageUrl: d1, slug: ""),
          TopMenuTiles(name: "Ice Cream", imageUrl: d1, slug: ""),
          TopMenuTiles(name: "Soft Drink", imageUrl: d1, slug: ""),
          TopMenuTiles(name: "Burger", imageUrl: d1, slug: ""),
          TopMenuTiles(name: "Sushi", imageUrl: d1, slug: ""),
        ],
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
