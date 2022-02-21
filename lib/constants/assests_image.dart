import 'package:revaki/model/dishmodel.dart';

final String imageAssetsRoot = "Images/";
final String background = _getImagePath("bg.png");
final String d1 = _getImagePath("done.jpg");
final String addpic = _getImagePath("add.png");
final String minuspic = _getImagePath("minus.png");
final String addp = _getImagePath("one.png");
final String minusp = _getImagePath("two.png");


final String kitchenpic = _getImagePath("kitchenpic.png");
final String kitchen2pic = _getImagePath("kitch2.png");
final String printerpic = _getImagePath("printerpic.png");

final List<dishmodelDishList?> GlobaldishModelList = List.empty(growable: true);


// https://stackoverflow.com/questions/50186555/how-to-set-margin-for-a-button-in-flutter
// https://stackoverflow.com/questions/52227846/how-can-i-add-shadow-to-the-widget-in-flutter

String _getImagePath(String fileName){
  return imageAssetsRoot + fileName;
}