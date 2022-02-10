

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revaki/constants/bezierContainer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: () => Future.value(false),
          child : Scaffold(
          body: Container(
          height: height,
          child: Stack(
          children: [
            Positioned(
                top: -height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                 child: BezierContainer()),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * .2),
                        //  _title(),
                        SizedBox(height: 50),
                        //   _emailPasswordWidget(),
                        SizedBox(height: 20),
                        // _submitButton(),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.centerRight,
                          child: Text('Forgot Password ?',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                        ),
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