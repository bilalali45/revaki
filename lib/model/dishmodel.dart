class dishmodelDishListVariantsData {
/*
{
  "Id": "3d5aa801-14a6-4e82-be5e-4b8f4c25951f",
  "Text": "Breakfast Pizza",
  "Price": 0,
  "Maximum": 1,
  "Minimum": 1
}
*/

  String? Id;
  String? Text;
  int? Price;
  int? Maximum;
  int? Minimum;

  dishmodelDishListVariantsData({
    this.Id,
    this.Text,
    this.Price,
    this.Maximum,
    this.Minimum,
  });
  dishmodelDishListVariantsData.fromJson(Map<String, dynamic> json) {
    Id = json['Id']?.toString();
    Text = json['Text']?.toString();
    Price = json['Price']?.toInt();
    Maximum = json['Maximum']?.toInt();
    Minimum = json['Minimum']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = Id;
    data['Text'] = Text;
    data['Price'] = Price;
    data['Maximum'] = Maximum;
    data['Minimum'] = Minimum;
    return data;
  }
}

class dishmodelDishListVariants {
/*
{
  "Id": "F45C1EE6-98B2-4F3F-BD36-61B3DD334F51",
  "Key": "Flavours",
  "Title": "Choose Your Flavours",
  "Description": "Select One",
  "Type": "SingleChoice",
  "Required": false,
  "Data": [
    {
      "Id": "3d5aa801-14a6-4e82-be5e-4b8f4c25951f",
      "Text": "Breakfast Pizza",
      "Price": 0,
      "Maximum": 1,
      "Minimum": 1
    }
  ]
}
*/

  String? Id;
  String? Key;
  String? Title;
  String? Description;
  String? Type;
  bool? Required;
  List<dishmodelDishListVariantsData?>? Data;

  dishmodelDishListVariants({
    this.Id,
    this.Key,
    this.Title,
    this.Description,
    this.Type,
    this.Required,
    this.Data,
  });
  dishmodelDishListVariants.fromJson(Map<String, dynamic> json) {
    Id = json['Id']?.toString();
    Key = json['Key']?.toString();
    Title = json['Title']?.toString();
    Description = json['Description']?.toString();
    Type = json['Type']?.toString();
    Required = json['Required'];
    if (json['Data'] != null) {
      final v = json['Data'];
      final arr0 = <dishmodelDishListVariantsData>[];
      v.forEach((v) {
        arr0.add(dishmodelDishListVariantsData.fromJson(v));
      });
      Data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = Id;
    data['Key'] = Key;
    data['Title'] = Title;
    data['Description'] = Description;
    data['Type'] = Type;
    data['Required'] = Required;
    if (Data != null) {
      final v = Data;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['Data'] = arr0;
    }
    return data;
  }
}

class dishmodelDishList {
/*
{
  "DishId": "dfcbee89-7188-4bca-abce-d4921202b4be",
  "ImageURL": "http://revakipos.com.asp1-101.phx1-1.websitetestlink.com//Images/pos/dish/dfcbee89-7188-4bca-abce-d4921202b4be.jpeg",
  "DishName": "Classic Pizza (Large)",
  "BarCode": "123",
  "InMinut": 2,
  "InSec": 2,
  "WeightInGram": "",
  "Discription": null,
  "CategoryId": "fa708f5f-c258-4b7f-a592-fe171e67d113",
  "TotalPrice": 1299,
  "PriceStartFrom": 0,
  "PlaceId": "2bec1011-305d-4324-91ae-34ff8e589764",
  "ApplyGST": true,
  "ApplyDiscount": true,
  "Variants": [
    {
      "Id": "F45C1EE6-98B2-4F3F-BD36-61B3DD334F51",
      "Key": "Flavours",
      "Title": "Choose Your Flavours",
      "Description": "Select One",
      "Type": "SingleChoice",
      "Required": false,
      "Data": [
        {
          "Id": "3d5aa801-14a6-4e82-be5e-4b8f4c25951f",
          "Text": "Breakfast Pizza",
          "Price": 0,
          "Maximum": 1,
          "Minimum": 1
        }
      ]
    }
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
    if (json['Variants'] != null) {
      final v = json['Variants'];
      final arr0 = <dishmodelDishListVariants>[];
      v.forEach((v) {
        arr0.add(dishmodelDishListVariants.fromJson(v));
      });
      Variants = arr0;
    }
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
    if (Variants != null) {
      final v = Variants;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['Variants'] = arr0;
    }
    return data;
  }
}

class dishmodel {
/*
{
  "DishList": [
    {
      "DishId": "dfcbee89-7188-4bca-abce-d4921202b4be",
      "ImageURL": "http://revakipos.com.asp1-101.phx1-1.websitetestlink.com//Images/pos/dish/dfcbee89-7188-4bca-abce-d4921202b4be.jpeg",
      "DishName": "Classic Pizza (Large)",
      "BarCode": "123",
      "InMinut": 2,
      "InSec": 2,
      "WeightInGram": "",
      "Discription": null,
      "CategoryId": "fa708f5f-c258-4b7f-a592-fe171e67d113",
      "TotalPrice": 1299,
      "PriceStartFrom": 0,
      "PlaceId": "2bec1011-305d-4324-91ae-34ff8e589764",
      "ApplyGST": true,
      "ApplyDiscount": true,
      "Variants": [
        {
          "Id": "F45C1EE6-98B2-4F3F-BD36-61B3DD334F51",
          "Key": "Flavours",
          "Title": "Choose Your Flavours",
          "Description": "Select One",
          "Type": "SingleChoice",
          "Required": false,
          "Data": [
            {
              "Id": "3d5aa801-14a6-4e82-be5e-4b8f4c25951f",
              "Text": "Breakfast Pizza",
              "Price": 0,
              "Maximum": 1,
              "Minimum": 1
            }
          ]
        }
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
