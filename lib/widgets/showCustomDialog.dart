import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showCustomDialog(BuildContext context) {
  Dialog fancyDialog = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Container(
       height: 300,
       width: 250,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              "Please First Start Shift",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, decoration:TextDecoration.underline),
            ),
             SizedBox(height: 50),
             _edittext()

          ]
      ),
    ),

  );
  showDialog(context: context, builder: (BuildContext context) => fancyDialog);
}

Widget _edittext() {
  return Column(
    children: <Widget>[
      _entryFieldemail("Email id"),

    ],
  );
}
Widget _entryFieldemail(String title) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            child:TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Please "
              ),
            )
        ),

      ],
    ),
  );


}