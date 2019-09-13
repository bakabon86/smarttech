import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    bool status;
    String token;
    String erc;
    String err;

    LoginModel({
        this.status,
        this.token,
        this.erc,
        this.err,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => new LoginModel(
        status: json["status"],
        token: json["token"],
        erc: json["erc"],
        err: json["err"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "erc": erc,
        "err": err,
    };
}
