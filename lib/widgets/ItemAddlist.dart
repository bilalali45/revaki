import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revaki/constants/assests_image.dart';
import 'package:revaki/model/dishmodel.dart';

class ItemAddlist extends StatefulWidget {
 // final List<dishmodelDishList?>? dishModelList;
 // ItemAddlist(this.dishModelList);

  @override
  _ItemAddlist createState() => _ItemAddlist();

  @override
  // TODO: implement key
  Key? key = additemkey;
}
int total_count = 0;
final GlobalKey<_ItemAddlist> additemkey= GlobalKey();
class _ItemAddlist extends State<ItemAddlist> {

  String selected = "first";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    //  height: MediaQuery.of(context).size.height,
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

/*class PopularListItems extends StatelessWidget {
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
                                     child: _addButton(),
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
}*/


class PopularListItems extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String rating;
  final String numberOfRating;
  final String price;
  final String slug;

  const PopularListItems(
      {@required  Key? key,
        required this.name,
        required this.imageUrl,
        required this.rating,
        required this.numberOfRating,
        required this.price,
        required this.slug})
      : super(key: key);


  @override
  _PopularListItemsState createState() => _PopularListItemsState();
}

class _PopularListItemsState extends State<PopularListItems> {

  int counter=0;

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
                                    child: _addButton(onTap: (){
                                      print("on tap called $counter");
                                      setState(() {
                                       ++counter;
                                      });
                                    }),
                                  ),

                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child:_itemcount(counter),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: _minusButton(),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: _itemsname(widget.name)
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
  final dishmodelDishList item;
  PopularListItemstitle(this.item);

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
  Widget _addButton({void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
     /*   onTap: () {
        //  _itemcount(9);
        },*/
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
      Text(i.toString())
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
          borderRadius: BorderRadius.all(Radius.circular(5)),),
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
      children:  GlobaldishModelList.map<Widget>((item){
         return PopularListItemstitle(item!);
        }
      ).toList(),
    );
  }
}
