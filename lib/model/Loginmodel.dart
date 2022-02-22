

class Loginmodel
{
/*
{
  "FirstName": "Demo_Admin",
  "LastName": "Manager",
  "Token": "65160A2D19524E8120D4418210A0CCD7",
  "PlaceId": "2bec1011-305d-4324-91ae-34ff8e589764"
}
*/

  late String FirstName;
  late String LastName;
  late String Token;
  late String PlaceId;

  Loginmodel({
    required this.FirstName,
    required this.LastName,
    required this.Token,
    required this.PlaceId,
  });
  Loginmodel.fromJson(Map<String, dynamic> json) {
    FirstName = json['FirstName'].toString();
    LastName = json['LastName'].toString();
    Token = json['Token'].toString();
    PlaceId = json['PlaceId'].toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['FirstName'] = FirstName;
    data['LastName'] = LastName;
    data['Token'] = Token;
    data['PlaceId'] = PlaceId;
    return data;
  }
}