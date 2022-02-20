

class SomeRootEntityFoodCategories {
  late String CategoryId;
  late String CategoryName;
  late String Type;
  late String ImageURL;
  String? Discription;

  SomeRootEntityFoodCategories({
    required this.CategoryId,
    required this.CategoryName,
    required this.Type,
    required this.ImageURL,
    required this.Discription,
  });
  SomeRootEntityFoodCategories.fromJson(Map<String, dynamic> json) {
    CategoryId = json['CategoryId'].toString()!!!;
    CategoryName = json['CategoryName'].toString()!!;
    Type = json['Type'].toString()!!;
    ImageURL = json['ImageURL'].toString()!!;
    Discription = json['Discription']??"";
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['CategoryId'] = CategoryId;
    data['CategoryName'] = CategoryName;
    data['Type'] = Type;
    data['ImageURL'] = ImageURL;
    data['Discription'] = Discription;
    return data;
  }
}

class SomeRootEntity {

  late List<SomeRootEntityFoodCategories> FoodCategories;
  late  bool Status;
  late int StatusCode;
  late  String Message;

  SomeRootEntity({
    required this.FoodCategories,
    required this.Status,
    required this.StatusCode,
    required this.Message,
  });
  SomeRootEntity.fromJson(Map<String, dynamic> json) {
    if (json['FoodCategories'] != null) {
      final v = json['FoodCategories'];
      final arr0 = <SomeRootEntityFoodCategories>[];
      v.forEach((v) {
        arr0.add(SomeRootEntityFoodCategories.fromJson(v));
      });
      FoodCategories = arr0;
    }
    Status = json['Status'];
    StatusCode = json['StatusCode']?.toInt();
    Message = json['Message'].toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (FoodCategories != null) {
      final v = FoodCategories;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v.toJson());
      });
      data['FoodCategories'] = arr0;
    }
    data['Status'] = Status;
    data['StatusCode'] = StatusCode;
    data['Message'] = Message;
    return data;
  }
}