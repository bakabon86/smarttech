class CheckMobileNo {
  bool status;
  String message;
  int statusCode;
  Result result;

CheckMobileNo({this.status, this.message, this.statusCode, this.result});

  factory CheckMobileNo.fromJson(Map<String, dynamic> json) {
    return CheckMobileNo(
      status : json['Status'],
      message : json['Message'],
      statusCode : json['StatusCode'],
      result : json['Result'],
    );
  }
}

class Result{
  String id;
  String email;
  String name;
  String mobileNo;
  String phone;
  House house;
}

class House{
  String townId;
  String townName;
  String projectId;
  String cluster;
  String number;
  String status;
  bool defaultUnit;
}