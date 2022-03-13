import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:revaki/Screens/HomePage.dart';
import 'package:revaki/Screens/Verification.dart';
import 'package:revaki/constants/assests_image.dart';
import 'package:revaki/constants/bezierContainer.dart';
import 'package:revaki/model/LoginmodelUserData.dart';
import 'package:dio/dio.dart';
import 'package:revaki/model/Usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
    var contxt;
    Dio _dio = Dio();
    Response? response;
    Loginmodel? _Loginmodel;

TextEditingController emailController = new TextEditingController();
TextEditingController passController = new TextEditingController();


class _HomePageState extends State<LoginPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  // SharedPreferences prefs = await SharedPreferences.getInstance();

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
      _entryFieldemail("Email id"),
      _entryField("Password", isPassword: true),
    ],
  );
}

Widget _submitButton() {

  return GestureDetector(
      onTap: () {
        // MaterialPageRoute(builder: (context) => HomePage());
        // showInSnackBar("test",contxt);
        _getData(emailController.text.toString(),passController.text.toString());



        // Navigator.push(
        //     contxt, MaterialPageRoute(builder: (context) => Verification())
        // );

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

void _getData(String email, String pass) async {
  // FormData _formData;
  // _formData = FormData.fromMap({
  //   "token"
  //   ""
  // });

  SharedPreferences prefs = await SharedPreferences.getInstance();
  Map<String, dynamic?> mapData = {
    "Email": email,
    "Password": pass
  };
  response = await _dio.post(
      "http://revaki.posapi.com.asp1-101.phx1-1.websitetestlink.com/api/RevakiPOSAPI/login",
       data: jsonEncode(mapData));
       _Loginmodel = Loginmodel.fromJson(response?.data);


    if(_Loginmodel?.StatusCode == StatusCode_Success){
      //final cuisine = response?.data['userdata'] as Js;
      final encoded = jsonEncode(_Loginmodel?.UserData);
      print(encoded);

      prefs.setString('userData',encoded);
           prefs.setBool(SharedLoginstatus, true);
       // var user = Usermodel.fromJson(encoded);

      GetStorage().write("placeid", _Loginmodel?.UserData!.PlaceId.toString());
      GetStorage().write("token", _Loginmodel?.UserData!.Token);
     // GetStorage().write("currenuserdata", _Loginmodel);
      //prefs.setString('userDatanext',user);
      print(_Loginmodel);
            // Navigator.push(
            //     contxt, MaterialPageRoute(builder: (context) => Verification(user!))
            //  );

      }else{
          showInSnackBar(_Loginmodel!.Message,contxt);
      }


}

Widget _entryFieldemail(String title, {bool isPassword = false}) {
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
            controller: emailController,
            obscureText: isPassword,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true))
      ],
    ),
  );


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
            controller: passController,
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
    content: Text(value),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
