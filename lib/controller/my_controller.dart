import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:revaki/constants/assests_image.dart';
import 'package:revaki/model/SomeRootEntityFoodCategories.dart';
import 'package:revaki/model/dishmodel.dart';
import 'package:revaki/services/api.dart';

class MyController extends GetxController {

  var productList =<dishmodelDishList?>[].obs;
  var catmodel =<SomeRootEntityFoodCategories?>[].obs;


  //SomeRootEntity catlists = obs as SomeRootEntity;
   //var List<dishmodelDishList?> productList = [].obs;
 // var dishmodel? _dishModel;
  //final someVariable = Rx<SomeRootEntity>().obs;
  // SomeRootEntity _yourObjectk;

  var searchList =<dishmodelDishList>[].obs;
  var  user = GetStorage().read('currenuserdata');

  var  placeid = GetStorage().read('placeid');
  var  token = GetStorage().read('token');
  //_getData();

  void fetchdata()async {
    try{

      print(user);
      var res=await network.getdata(placeid: placeid,token:token);
      var rescat=await network.getcat(placeid: placeid,token:token);

      //if (res != null) {
        print("Responsecat******************************************************:${res}" );
      print("Respo******************************************************:${rescat}" );
        productList.value = res!.DishList!;
        catmodel.value = rescat!.FoodCategories!;


      //   _dishModel = res;
     // }
      print(res);
      //print("prooooooooooooooooo${_catmodel}" );

    }finally{

    }
  }

  void search(String txt)async {
    searchlist.clear();

    for(var item in Globallistdata ){
      // dishmodelDishList dishList = item
      if(item!.DishName!.startsWith(txt)){
        searchlist.add(item);
      }
    }
    if(searchlist.length != 0) {
      Globallistdata.clear();
      Globallistdata = searchlist;
      productList.value = Globallistdata;
    }
  }
}