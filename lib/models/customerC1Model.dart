class CustomerC1Model {
  int asgId;
  String name;
  String address;
  String mobileNo;
  String email;
  bool verified;
  bool isActive;
  List<DataUnit> units;
  String pictUrl;

  CustomerC1Model(
      {this.asgId,
      this.name,
      this.address,
      this.mobileNo,
      this.email,
      this.verified,
      this.isActive,
      this.units,
      this.pictUrl});

  factory CustomerC1Model.fromJson(Map<String, dynamic> json) =>
      CustomerC1Model(
        asgId: json["asgId"],
        name: json["name"],
        address: json["address"],
        mobileNo: json["mobileNo"],
        email: json["email"],
        verified: json["verified"],
        isActive: json["isActive"],
        units:
            List<DataUnit>.from(json["units"].map((x) => DataUnit.fromJson(x))),
        pictUrl: json["pictUrl"],
      );

  Map<String, dynamic> toJson() => {
        "asgId": asgId,
        "name": name,
        "address": address,
        "mobileNo": mobileNo,
        "email": email,
        "verified": verified,
        "isActive": isActive,
        "units": List<dynamic>.from(units.map((x) => x.toJson())),
      };
}

class DataUnit {
  String asgId;
  String companyCode;
  String lotNo;
  bool isPemilik;
  bool defaultUnit;

  DataUnit(
      {this.asgId,
      this.companyCode,
      this.lotNo,
      this.isPemilik,
      this.defaultUnit});

  factory DataUnit.fromJson(Map<String, dynamic> json) => DataUnit(
        asgId: json["asgId"],
        companyCode: json["companyCode"],
        lotNo: json["lotNo"],
        isPemilik: json["isPemilik"],
        defaultUnit: json["defaultUnit"],
      );

  Map<String, dynamic> toJson() => {
        "asgId": asgId,
        "companyCode": companyCode,
        "lotNo": lotNo,
        "isPemilik": isPemilik,
        "defaultUnit": defaultUnit
      };
}
