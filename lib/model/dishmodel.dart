class dishmodelDishList {
/*
{
  "DishId": "85dbe686-c238-4817-985d-c012c7672d94",
  "ImageURL": "http://revakipos.com.asp1-101.phx1-1.websitetestlink.com//Images/pos/dish/85dbe686-c238-4817-985d-c012c7672d94.jpeg",
  "DishName": "Angel Food Cake With Caramel Fluff",
  "BarCode": "123",
  "InMinut": 15,
  "InSec": 0,
  "WeightInGram": "",
  "Discription": null,
  "CategoryId": "ab780904-8b47-4bc0-a77e-ad0675eee503",
  "TotalPrice": 450,
  "PriceStartFrom": 0,
  "PlaceId": "2bec1011-305d-4324-91ae-34ff8e589764",
  "ApplyGST": true,
  "ApplyDiscount": true,
  "Variants": [
    null
  ]
}
*/

  String? DishId;
  String? ImageURL;
  String? DishName;
  String? BarCode;
  int? InMinut;
  int? InSec;
  String? WeightInGram;
  String? Discription;
  String? CategoryId;
  int? TotalPrice;
  int? PriceStartFrom;
  String? PlaceId;
  bool? ApplyGST;
  bool? ApplyDiscount;
  List<dishmodelDishListVariants?>? Variants;

  dishmodelDishList({
    this.DishId,
    this.ImageURL,
    this.DishName,
    this.BarCode,
    this.InMinut,
    this.InSec,
    this.WeightInGram,
    this.Discription,
    this.CategoryId,
    this.TotalPrice,
    this.PriceStartFrom,
    this.PlaceId,
    this.ApplyGST,
    this.ApplyDiscount,
    this.Variants,
  });
  dishmodelDishList.fromJson(Map<String, dynamic> json) {
    DishId = json['DishId']?.toString();
    ImageURL = json['ImageURL']?.toString();
    DishName = json['DishName']?.toString();
    BarCode = json['BarCode']?.toString();
    InMinut = json['InMinut']?.toInt();
    InSec = json['InSec']?.toInt();
    WeightInGram = json['WeightInGram']?.toString();
    Discription = json['Discription']?.toString();
    CategoryId = json['CategoryId']?.toString();
    TotalPrice = json['TotalPrice']?.toInt();
    PriceStartFrom = json['PriceStartFrom']?.toInt();
    PlaceId = json['PlaceId']?.toString();
    ApplyGST = json['ApplyGST'];
    ApplyDiscount = json['ApplyDiscount'];
    >>>>>>error<<<<<<
    }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['DishId'] = DishId;
    data['ImageURL'] = ImageURL;
    data['DishName'] = DishName;
    data['BarCode'] = BarCode;
    data['InMinut'] = InMinut;
    data['InSec'] = InSec;
    data['WeightInGram'] = WeightInGram;
    data['Discription'] = Discription;
    data['CategoryId'] = CategoryId;
    data['TotalPrice'] = TotalPrice;
    data['PriceStartFrom'] = PriceStartFrom;
    data['PlaceId'] = PlaceId;
    data['ApplyGST'] = ApplyGST;
    data['ApplyDiscount'] = ApplyDiscount;
    >>>>>>error<<<<<<
    return data;
  }
}

class dishmodel {
/*
{
  "DishList": [
    {
      "DishId": "85dbe686-c238-4817-985d-c012c7672d94",
      "ImageURL": "http://revakipos.com.asp1-101.phx1-1.websitetestlink.com//Images/pos/dish/85dbe686-c238-4817-985d-c012c7672d94.jpeg",
      "DishName": "Angel Food Cake With Caramel Fluff",
      "BarCode": "123",
      "InMinut": 15,
      "InSec": 0,
      "WeightInGram": "",
      "Discription": null,
      "CategoryId": "ab780904-8b47-4bc0-a77e-ad0675eee503",
      "TotalPrice": 450,
      "PriceStartFrom": 0,
      "PlaceId": "2bec1011-305d-4324-91ae-34ff8e589764",
      "ApplyGST": true,
      "ApplyDiscount": true,
      "Variants": [
        null
      ]
    }
  ],
  "Status": true,
  "StatusCode": 101,
  "Message": "Success!"
}
*/

  List<dishmodelDishList?>? DishList;
  bool? Status;
  int? StatusCode;
  String? Message;

  dishmodel({
    this.DishList,
    this.Status,
    this.StatusCode,
    this.Message,
  });
  dishmodel.fromJson(Map<String, dynamic> json) {
    if (json['DishList'] != null) {
      final v = json['DishList'];
      final arr0 = <dishmodelDishList>[];
      v.forEach((v) {
        arr0.add(dishmodelDishList.fromJson(v));
      });
      DishList = arr0;
    }
    Status = json['Status'];
    StatusCode = json['StatusCode']?.toInt();
    Message = json['Message']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (DishList != null) {
      final v = DishList;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['DishList'] = arr0;
    }
    data['Status'] = Status;
    data['StatusCode'] = StatusCode;
    data['Message'] = Message;
    return data;
  }
}