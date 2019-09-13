// To parse this JSON data, do
//
//     final listInstance = listInstanceFromJson(jsonString);

import 'dart:convert';

ListInstance listInstanceFromJson(String str) => ListInstance.fromJson(json.decode(str));

String listInstanceToJson(ListInstance data) => json.encode(data.toJson());

class ListInstance {
    bool status;
    List<Datum> data;

    ListInstance({
        this.status,
        this.data,
    });

    factory ListInstance.fromJson(Map<String, dynamic> json) => new ListInstance(
        status: json["status"],
        data: new List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String key;
    String name;
    bool isDefault;
    String expiration;

    Datum({
        this.key,
        this.name,
        this.isDefault,
        this.expiration,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
        key: json["key"],
        name: json["name"],
        isDefault: json["isDefault"],
        expiration: json["expiration"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "isDefault": isDefault,
        "expiration": expiration,
    };
}