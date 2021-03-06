import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revaki/model/Usermodel.dart';
import 'HomePage.dart';



class Verification extends StatefulWidget {
  //final Usermodel usermodel;
//  const Verification(this.usermodel, {Key? key}) : super(key: key);
   @override
  _Verification createState() => _Verification();

}

class _Verification extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff7f6fb),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                width: 200,
                height: 200,
                 alignment: Alignment.center,
                 decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                  ),
                 child: Text(
                'Revaki Pos',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter your Pin code",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 28,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _textFieldOTP(first: true, last: false),
                        _textFieldOTP(first: false, last: false),
                        _textFieldOTP(first: false, last: false),
                        _textFieldOTP(first: false, last: true),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => HomePage())
                          );
                        },
                        style: ButtonStyle(
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                           // child:thisScreenNeeds()
                             child: Text(
                               'Verify',
                                style: TextStyle(fontSize: 16),
                          ),


                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              // Text(
              //   "Didn't you receive any code?",
              //   style: TextStyle(
              //     fontSize: 14,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.black38,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              SizedBox(
                height: 18,
              ),
              // Text(
              //   "Resend New Code",
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.purple,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
            ],
          ),
        ),
      ),
    );
  }
  Widget thisScreenNeeds() {
    return Container(
        child: RaisedButton(
            child: Text(
              'Verify',
              style: TextStyle(fontSize: 16),

            ),
          onPressed: () {
            // Unable to add, setState(). Throwing error.
          },
        ));
  }
  Widget _textFieldOTP({required bool first, last}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 2.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.purple),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}