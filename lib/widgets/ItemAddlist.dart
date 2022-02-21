import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revaki/constants/assests_image.dart';
import 'package:revaki/model/dishmodel.dart';
import '../constants/assests_image.dart';

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
          Container(
            height: 280,
            child: ItemAddlistitem(),
          ),
           Container(
             height: 120,
            child: Additemview(),
           ),
          Expanded(
            child: Additembutton(),
          )

        ],
      ),
    );
  }
}

class PopularListItems extends StatefulWidget {

  final dishmodelDishList item;
  PopularListItems(this.item);
  // const PopularListItems(
  //     {@required  Key? key,
  //      })
  //     : super(key: key);


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
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: _addButton(onTap: (){
                                      print("on tap called $counter");
                                      setState(() {
                                       ++counter;
                                      });
                                    }),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child:_itemcount(counter),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: _minusButton(),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: _itemsname(widget.item.DishName.toString())
                                  ),



                                  // _MinusButton(),
                                ]
                            ),

                          ),

                          Container(
                            child: Row(
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: _itemamount("Rs 1200")
                                  )]

                            )
                          )

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



Widget _itemamount(String name) {
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
class Additembutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
            children: <Widget>[
               _submitButton(context)
            ]
        )
    );
  }

}
Widget _submitButton(BuildContext context) {

  return GestureDetector(
      onTap: () {
        // MaterialPageRoute(builder: (context) => HomePage());
        // showInSnackBar("test",contxt);
      },
      child: Container(
        height: 50,
        width: 300,
        margin: new EdgeInsets.symmetric(horizontal: 20.0),
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff8d8d8d), Color(0xff8d8d8d)])),
        child: Text(
          '0 items = Rs 0',
          style: TextStyle(fontSize: 15, color: Colors.white),
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
                              margin: const EdgeInsets.all(10),
                              child : Column(
                                children: <Widget>[

                                  Container(
                                      child : Row(
                                       children: <Widget>[
                                         new Padding(
                                           padding:  const EdgeInsets.all(5.0),
                                           child:Image.asset(printerpic,height: 40),
                                          ),
                                         new Padding(
                                           padding:  const EdgeInsets.all(5.0),
                                           child:Image.asset(kitchenpic,height: 40),
                                         ),
                                     ]
                                   )

                                ),
                                  Container(
                                      child : Row(
                                          children: <Widget>[
                                          new Padding(
                                            padding:  const EdgeInsets.all(5.0),
                                             child:Image.asset(kitchen2pic,height: 40),
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
                                                fontSize: 15, color: Colors.black)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text('Add Discount',
                                            style: TextStyle(
                                                fontSize: 15, color: Colors.black)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text('Sale tax 13%: Rs',
                                            style: TextStyle(
                                                fontSize: 15, color: Colors.black)),
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
         return PopularListItems(item!);
        }
      ).toList(),
    );
  }
}
