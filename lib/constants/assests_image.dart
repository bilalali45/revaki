final String imageAssetsRoot = "Images/";
// final String image1 = _getImagePath("01.png");
// final String splash_logo = _getImagePath("app_logo.png");
final String background = _getImagePath("bg.png");
// final String location_icon = _getImagePath("location.png");
// final String dateavailable_img = _getImagePath("dateavailable.png");
// final String facilities = _getImagePath("facilities.png");
// final String gallery_img = _getImagePath("galleryicon.png");
// final String infoicon = _getImagePath("info.png");


// https://stackoverflow.com/questions/50186555/how-to-set-margin-for-a-button-in-flutter
// https://stackoverflow.com/questions/52227846/how-can-i-add-shadow-to-the-widget-in-flutter

String _getImagePath(String fileName){
  return imageAssetsRoot + fileName;
}