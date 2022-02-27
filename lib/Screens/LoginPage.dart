import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revaki/Screens/HomePage.dart';
import 'package:revaki/Screens/Verification.dart';
import 'package:revaki/constants/bezierContainer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
  var contxt;
class _HomePageState extends State<LoginPage> {

  Dio _dio = Dio();
  Response? response;
  @override
  Widget build(BuildContext context) {
    contxt = context;
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: () => Future.value(false),
          child : Scaffold(
          body: Container(
          height: height,
          child: Stack(
          children: [
            Container(
                   padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * .2),
                          Text(
                            "Revaki Pos",
                             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            SizedBox(height: 50),
                           _emailPasswordWidget(),
                            SizedBox(height: 20),
                           _submitButton(),

                        //  _divider(),
                        //  _facebookButton(),
                            SizedBox(height: height * .055),
                        //  _createAccountLabel(),
                      ],
                    ),
                  ),
               )

              ]
           )
         )
        )
    );
  }


}

Widget _emailPasswordWidget() {
  return Column(
    children: <Widget>[
      _entryField("Email id"),
      _entryField("Password", isPassword: true),
    ],
  );
}

Widget _submitButton() {

  return GestureDetector(
      onTap: () {
        // MaterialPageRoute(builder: (context) => HomePage());
        // showInSnackBar("test",contxt);
        Navigator.push(
            contxt, MaterialPageRoute(builder: (context) => Verification())
        );


      },
      child: Container(
        width: MediaQuery.of(contxt).size.width,
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
                  'Login',
                  style: TextStyle(fontSize: 20, color: Colors.white),
               ),
      ));
}

Widget _entryField(String title, {bool isPassword = false}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true))
      ],
    ),
  );
}


void showInSnackBar(String value, BuildContext context) {
  final snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}