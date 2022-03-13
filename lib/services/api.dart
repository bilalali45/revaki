
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:revaki/model/SomeRootEntityFoodCategories.dart';
import 'package:revaki/model/dishmodel.dart';



class network {
  //Dio dio = Dio();
  //Response? response;
  Response? responsecat;
  Response? categoryresponse;
 // dishmodel? _dishModel;
  SomeRootEntity? _catModel;


  static Future<dishmodel?> getdata({String? placeid,String? token} ) async {
    //
    // Map<String, dynamic?> mapData = {
    //   "PlaceId": widget.usermodel!.PlaceId,
    //   "Token": widget.usermodel!.Token
    // };
    var response = await Dio().post(
        "http://revaki.posapi.com.asp1-101.phx1-1.websitetestlink.com/api/RevakiPOSAPI/dishlist",
        data: jsonEncode({
          "PlaceId":placeid,// widget.usermodel!.PlaceId,
             "Token":token, //widget.usermodel!.Token
        }
        ));
     var _dishModel = dishmodel.fromJson(response?.data);
    // print("Responsecat******************************************************:${response}" );
     return _dishModel;

    // responsecat = await _dio.post(
    //     "http://revaki.posapi.com.asp1-101.phx1-1.websitetestlink.com/api/RevakiPOSAPI/foodcategorieslist",
    //     data: jsonEncode(mapData));
    // //print("Response222:"+response!.data!.toString());
    // _dishModel = dishmodel.fromJson(response?.data);
    // _catModel = SomeRootEntity.fromJson(responsecat?.data);
    // print("Response222:" + response!.data!.toString());
    // print("Responsecat:" + responsecat!.data!.toString());
   // setState(() {});
  }

  static Future<SomeRootEntity?> getcat({String? placeid,String? token} ) async {
    //
    // Map<String, dynamic?> mapData = {
    //   "PlaceId": widget.usermodel!.PlaceId,
    //   "Token": widget.usermodel!.Token
    // };
    var responsecat = await Dio().post(
        "http://revaki.posapi.com.asp1-101.phx1-1.websitetestlink.com/api/RevakiPOSAPI/foodcategorieslist",
        data: jsonEncode({
          "PlaceId":placeid,// widget.usermodel!.PlaceId,
          "Token":token, //widget.usermodel!.Token
        }
        ));
   // var _dishModel = dishmodel.fromJson(response?.data);
    var _catModel = SomeRootEntity.fromJson(responsecat?.data);
    // print("Responsecat******************************************************:${response}" );
    return _catModel;

    // responsecat = await _dio.post(
    //     "http://revaki.posapi.com.asp1-101.phx1-1.websitetestlink.com/api/RevakiPOSAPI/foodcategorieslist",
    //     data: jsonEncode(mapData));
    // //print("Response222:"+response!.data!.toString());
    // _dishModel = dishmodel.fromJson(response?.data);
    // _catModel = SomeRootEntity.fromJson(responsecat?.data);
    // print("Response222:" + response!.data!.toString());
    // print("Responsecat:" + responsecat!.data!.toString());
    // setState(() {});
  }
}