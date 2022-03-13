import 'package:flutter/material.dart';
import 'package:revaki/constants/assests_image.dart';
import 'package:revaki/controller/controllerhonepage.dart';
import 'package:revaki/controller/my_controller.dart';
import 'package:revaki/widgets/PopularFoodsWidget.dart';
import 'package:get/get.dart';
import 'package:revaki/controller/my_controller.dart';

class SearchWidget extends StatefulWidget {

  const SearchWidget({Key? key}) : super(key: key);
  @override
  _SearchWidget createState() => _SearchWidget();


}
MyController myController = Get.put(MyController());

TextEditingController searchtxt = new TextEditingController();
// final controllerhonepage countController = Get.put(controllerhonepage());


class _SearchWidget extends State<SearchWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0,top: 0,right: 0,bottom: 5),
      child: TextField(
        controller: searchtxt,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
              width: 0,
              color: Color(0xFFfb3132),
              style: BorderStyle.none,
            ),
          ),
            filled: true,
            prefixIcon: IconButton(
              icon: new Icon(Icons.search),
              color: Color(0xFFfb3132), onPressed: () {
                _shear(searchtxt.text.toString());
            },

            ),
          fillColor: Color(0xFFFAFAFA),
          // suffixIcon: Icon(Icons.sort,color: Color(0xFFfb3132),),

          suffixIcon: IconButton(
              icon: new Icon(Icons.sort),
              color: Color(0xFFfb3132), onPressed: () {
               _alldata("");
          }),
          hintStyle: new TextStyle(color: Color(0xFFd0cece), fontSize: 18),
          hintText: "What would your like to buy?",
        ),
      ),
    );
  }


}

void _shear(String text) {
  myController.search(text);
}

void _alldata(String text) {
  myController.fetchdata();
}