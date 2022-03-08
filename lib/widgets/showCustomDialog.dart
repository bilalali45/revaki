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
             SizedBox(height: 20),
             _edittext(),
              SizedBox(height: 20),
              _submitButton(context)
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
            child:Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: 'Enter Prices',
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true),

                      ),
            )
                ),

      ],
    ),
  );


}

Widget _submitButton(BuildContext context) {

  return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pop();

      },
      child: Container(
          width: 150,
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
                colors: [Color(0xff00b0ff), Color(0xff69e2ff)])),
                child: Text(
                  'Start',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
      ));
}