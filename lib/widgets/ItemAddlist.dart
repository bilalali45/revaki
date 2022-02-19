import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revaki/constants/assests_image.dart';
import 'package:revaki/model/dishmodel.dart';

class ItemAddlist extends StatefulWidget {
  final List<dishmodelDishList?>? dishModelList;
  ItemAddlist(this.dishModelList);
  @override
  _ItemAddlist createState() => _ItemAddlist();
}
int total_count = 0;
class _ItemAddlist extends State<ItemAddlist> {

  String selected = "first";

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          ///PopularListItemstitle(),
          Expanded(
            child: ItemAddlistitem(),
          ),
          Expanded(
            child: Additemview(),
          )
        ],
      ),
    );
  }
}

class PopularListItems extends StatelessWidget {
  String name;
  String imageUrl;
  String rating;
  String numberOfRating;
  String price;
  String slug;

  PopularListItems(
      {@required  Key? key,
        required this.name,
        required this.imageUrl,
        required this.rating,
        required this.numberOfRating,
        required this.price,
        required this.slug})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Navigator.push(context, ScaleRoute(page: FoodDetailsPage()));
      },
      child: Column(
         children: <Widget>[
            Container(
             padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
              decoration: BoxDecoration(boxShadow: [
              ]),
            child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                 child: Container(
                   width: MediaQuery.of(context).size.width,
                   height: 80,
                   child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(

                            child: Row(
                                children: <Widget>[
                                  SizedBox(height: 20),
                                   Padding(
                                    padding: const EdgeInsets.all(6.0),
                                     child:_addButton(),
                                    ),

                                  SizedBox(height: 20),
                                  Padding(
                                       padding: const EdgeInsets.all(6.0),
                                        child:_itemcount(0),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                       padding: const EdgeInsets.all(6.0),
                                        child: _minusButton(),
                                  ),
                                  SizedBox(height: 20),
                                    Padding(
                                        padding: const EdgeInsets.all(6.0),
                                         child: _itemsname(name)
                                    ),

                                  // _MinusButton(),
                                ]
                            ),

                          ),

                        ],
                      ),

                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class PopularListItemstitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
          Container(
              child: Row(
                  children: <Widget>[
                        SizedBox(width: 20),
                         _addButton(),
                         SizedBox(width: 20),
                      // _MinusButton(),
                        ]
                    ),

               ),




        ],
      ),
    );
  }
}
  Widget _addButton() {
    return GestureDetector(
        onTap: () {

          total_count++;
          _itemcount(7);


          },
        child: Container(
          width: 30,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
           decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),

                 ),
                  child: Image.asset(
                    addp,
                  ),
                 ));
  }


Widget _itemsname(String name) {
  return Column(
    children: <Widget>[
      Text(name)
    ],
  );
}

Widget _itemcount(int i) {
  return Column(
    children: <Widget>[

      Text(i.
      toString()
      )
    ],
  );
}
Widget _minusButton() {
  return GestureDetector(
      onTap: () {
      },
      child: Container(
        width: 40,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),

        ),
        child: Image.asset(
          minusp,
        ),
      ));
}



  class Additemview extends StatelessWidget {
    @override
     Widget build(BuildContext context) {
       return Container(
          child: Column(
              children: <Widget>[
                  Container(
                      color: Colors.white,
                      child : Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.all(30),
                              child : Column(
                                children: <Widget>[

                                  Container(
                                      child : Row(
                                     children: <Widget>[
                                       new Padding(
                                         padding: const EdgeInsets.only(left: 5.0),
                                         child: new Icon(Icons.delete, size: 50.0),
                                       ),
                                       new Padding(
                                         padding: const EdgeInsets.only(left: 5.0),
                                         child: new Icon(Icons.edit, size: 50.0),
                                       ),
                                       ]
                                   )

                                ),
                                  Container(
                                      child : Row(
                                          children: <Widget>[
                                            new Padding(
                                              padding: const EdgeInsets.only(left: 5.0),
                                              child: new Icon(Icons.delete, size: 50.0),
                                            ),

                                          ]
                                      )


                                  ),
                              // Container(
                              //   color: Colors.orange,
                              //   child: FlutterLogo(
                              //     size: 60.0,
                              //   ),
                              // ),

                            ],

                           )
                          ),
                        ),
                        Expanded(
                          child: Container(
                                child : Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text('Subtotal: Rs 0',
                                            style: TextStyle(
                                                fontSize: 20, color: Colors.black)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text('Add Discount',
                                            style: TextStyle(
                                                fontSize: 20, color: Colors.black)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text('Sale tax 13%: Rs',
                                            style: TextStyle(
                                                fontSize: 20, color: Colors.black)),
                                      ),

                                    ]
                                )
                            )
                        )
                      ],
                   )

                )

             ]

        )
      );
    }
  }

class ItemAddlistitem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        PopularListItems(
            name: "Fried Egg",
            imageUrl: d1,
            rating: '4.9',
            numberOfRating: '200',
            price: '15.06',
            slug: "fried_egg"),
        PopularListItems(
            name: "Mixed Vegetable",
            imageUrl: d1,
            rating: "4.9",
            numberOfRating: "100",
            price: "17.03",
            slug: ""),
        PopularListItems(
            name: "Salad With Chicken",
            imageUrl: d1,
            rating: "4.0",
            numberOfRating: "50",
            price: "11.00",
            slug: ""),
        PopularListItems(
            name: "Mixed Salad",
            imageUrl: d1,
            rating: "4.00",
            numberOfRating: "100",
            price: "11.10",
            slug: ""),
        PopularListItems(
            name: "Red meat,Salad",
            imageUrl: d1,
            rating: "4.6",
            numberOfRating: "150",
            price: "12.00",
            slug: ""),
        PopularListItems(
            name: "Mixed Salad",
            imageUrl: d1,
            rating: "4.00",
            numberOfRating: "100",
            price: "11.10",
            slug: ""),
        PopularListItems(
            name: "Potato,Meat fry",
            imageUrl: d1,
            rating: "4.2",
            numberOfRating: "70",
            price: "23.0",
            slug: ""),
        PopularListItems(
            name: "Fried Egg",
            imageUrl: d1,
            rating: '4.9',
            numberOfRating: '200',
            price: '15.06',
            slug: "fried_egg"),
        PopularListItems(
            name: "Red meat,Salad",
            imageUrl: d1,
            rating: "4.6",
            numberOfRating: "150",
            price: "12.00",
            slug: ""),
      ],
    );
  }
}
