import 'dart:math';

import 'package:flutter/material.dart';
import 'package:revaki/animation/ScaleRoute.dart';
import 'package:revaki/constants/assests_image.dart';
import 'package:revaki/constants/assests_image.dart';
import 'package:revaki/constants/assests_image.dart';
import 'package:revaki/model/dishmodel.dart';
import 'package:revaki/widgets/ItemAddlist.dart';
import 'package:revaki/constants/assests_image.dart';
import 'package:revaki/widgets/showCustomDialog.dart';

import '../constants/assests_image.dart';


class PopularFoodsWidget extends StatefulWidget {

  final List<dishmodelDishList?>? dishModelList;
  PopularFoodsWidget(this.dishModelList,{Key? key}):super(key: key);
  @override
  _PopularFoodsWidgetState createState() => _PopularFoodsWidgetState();

  @override
  // TODO: implement key
  Key? keylist = addfooddish;

}


final GlobalKey<_PopularFoodsWidgetState> addfooddish = GlobalKey();

class _PopularFoodsWidgetState extends State<PopularFoodsWidget> {

  @override
  void initState() {
    super.initState();
      Globallistdata = widget.dishModelList!;

  }



  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          PopularFoodTitle(),
          Expanded(
            child: PopularFoodItems(Globallistdata),
             // child: PopularFoodItems(),
          )
        ],
      ),
    );
  }
}

class PopularFoodTiles extends StatelessWidget {
/*  String name;
  String imageUrl;
  String rating;
  String numberOfRating;
  String price;
  String slug;*/
  final dishmodelDishList model;



  PopularFoodTiles(this.model,
      {@required  Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(StatusCode_Save == false){
            StatusCode_Save == true;
            showCustomDialog(context);
        }else{
          GlobaldishModelList.add(model);
          if(additemkey.currentState != null)
            additemkey.currentState!.setState(() {
            });
        }

        //Navigator.push(context, ScaleRoute(page: FoodDetailsPage()));
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(boxShadow: [
              /* BoxShadow(
                color: Color(0xFFfae3e2),
                blurRadius: 15.0,
                offset: Offset(0, 0.75),
              ),*/
            ]),
            child: Card(
                color: Color.fromRGBO(68, 78, 94,1),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              alignment: Alignment.topRight,
                              width: double.infinity,
                              padding: EdgeInsets.only(right: 5, top: 5),
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white70,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFfae3e2),
                                        blurRadius: 25.0,
                                        offset: Offset(0.0, 0.75),
                                      ),
                                    ]),

                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Center(
                                child: Image.network(model.ImageURL!!,
                                    height: 70,
                                    fit: BoxFit.cover, width: double.infinity,

                            )),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(left: 5, top: 5),
                            child: Text(model.DishName!!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ),
                          // Container(
                          //   alignment: Alignment.topRight,
                          //   padding: EdgeInsets.only(right: 5),
                          //   child: Container(
                          //     height: 28,
                          //     width: 28,
                          //     decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         color: Colors.white70,
                          //         boxShadow: [
                          //           BoxShadow(
                          //             color: Color(0xFFfae3e2),
                          //             blurRadius: 25.0,
                          //             offset: Offset(0.0, 0.75),
                          //           ),
                          //         ]),
                          //     child: Icon(
                          //       Icons.near_me,
                          //       color: Color(0xFFfb3132),
                          //       size: 16,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // Container(
                              //   alignment: Alignment.topLeft,
                              //   padding: EdgeInsets.only(left: 5, top: 5),
                              //   child: Text("2",
                              //       style: TextStyle(
                              //           color: Color(0xFF6e6e71),
                              //           fontSize: 10,
                              //           fontWeight: FontWeight.w400)),
                              // ),

                            ],
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(left: 5, top: 5, right: 5),
                            child: Text('Rs ' + model.TotalPrice.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600)),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class PopularFoodTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Popluar Foods",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFF3a3a3b),
                fontWeight: FontWeight.w300),
          ),
          Text(
            "See all",
             style: TextStyle(
                fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w100),
          )
        ],
      ),
    );
  }
}

class PopularFoodItems extends StatelessWidget {
  List<dishmodelDishList?>? dishModelList;
  PopularFoodItems(this.dishModelList);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount:dishModelList?.length ?? 0,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3),
         itemBuilder: (BuildContext context, int index) {
        var model=dishModelList![index];
        return  PopularFoodTiles(model!);
      });
  }
}


// class PopularFoodItems extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       primary: false,
//       padding: const EdgeInsets.all(10),
//       crossAxisCount: 3,
//       children: <Widget>[
//         PopularFoodTiles(
//             name: "Fried Egg",
//             imageUrl: d1,
//             rating: '4.9',
//             numberOfRating: '200',
//             price: '15.06',
//             slug: "fried_egg"),
//         PopularFoodTiles(
//             name: "Mixed Vegetable",
//             imageUrl: d1,
//             rating: "4.9",
//             numberOfRating: "100",
//             price: "17.03",
//             slug: ""),
//         PopularFoodTiles(
//             name: "Salad With Chicken",
//             imageUrl: d1,
//             rating: "4.0",
//             numberOfRating: "50",
//             price: "11.00",
//             slug: ""),
//         PopularFoodTiles(
//             name: "Mixed Salad",
//             imageUrl: d1,
//             rating: "4.00",
//             numberOfRating: "100",
//             price: "11.10",
//             slug: ""),
//         PopularFoodTiles(
//             name: "Red meat,Salad",
//             imageUrl: d1,
//             rating: "4.6",
//             numberOfRating: "150",
//             price: "12.00",
//             slug: ""),
//         PopularFoodTiles(
//             name: "Mixed Salad",
//             imageUrl: d1,
//             rating: "4.00",
//             numberOfRating: "100",
//             price: "11.10",
//             slug: ""),
//         PopularFoodTiles(
//             name: "Potato,Meat fry",
//             imageUrl: d1,
//             rating: "4.2",
//             numberOfRating: "70",
//             price: "23.0",
//             slug: ""),
//         PopularFoodTiles(
//             name: "Fried Egg",
//             imageUrl: d1,
//             rating: '4.9',
//             numberOfRating: '200',
//             price: '15.06',
//             slug: "fried_egg"),
//         PopularFoodTiles(
//             name: "Red meat,Salad",
//             imageUrl: d1,
//             rating: "4.6",
//             numberOfRating: "150",
//             price: "12.00",
//             slug: ""),
//       ],
//     );
//   }
// }
