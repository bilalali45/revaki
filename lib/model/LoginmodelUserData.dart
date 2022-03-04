

class LoginmodelUserData {
/*
{
  "FirstName": "Demo_Admin",
  "LastName": "Manager",
  "Token": "22E4D70F0142578780491AC6FA443E5A",
  "PlaceId": "2bec1011-305d-4324-91ae-34ff8e589764"
}
*/

  late String FirstName;
  late String LastName;
  late String Token;
  late String PlaceId;

  LoginmodelUserData({
    required this.FirstName,
    required this.LastName,
    required this.Token,
    required this.PlaceId,
  });
  LoginmodelUserData.fromJson(Map<String, dynamic> json) {
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

class Loginmodel {

  LoginmodelUserData? UserData;
  late String CurrentDate;
  late bool Status;
  late int StatusCode;
  late String Message;

  Loginmodel({
    required this.UserData,
    required this.CurrentDate,
    required this.Status,
    required this.StatusCode,
    required this.Message,
  });
  Loginmodel.fromJson(Map<String, dynamic> json) {
    UserData = (json['UserData'] != null) ? LoginmodelUserData.fromJson(json['UserData']) : null;
    CurrentDate = json['CurrentDate'].toString();
    Status = json['Status'];
    StatusCode = json['StatusCode'].toInt();
    Message = json['Message'].toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (UserData != null) {
      data['UserData'] = UserData?.toJson();
    }
    data['CurrentDate'] = CurrentDate;
    data['Status'] = Status;
    data['StatusCode'] = StatusCode;
    data['Message'] = Message;
    return data;
  }
}