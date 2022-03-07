

class Usermodel {
   String FirstName;
   String LastName;
   String Token;
   String PlaceId;

  Usermodel(this.FirstName, this.LastName,this.Token,this.PlaceId);

  factory Usermodel.fromJson(dynamic json) {
    return Usermodel(json['FirstName'] as String, json['LastName'] as String,json['Token'] as String,json['PlaceId'] as String);
  }

  @override
  String toString() {
    return '{ ${this.FirstName}, ${this.LastName},${this.Token},${this.PlaceId} }';
  }
}