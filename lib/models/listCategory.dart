// To parse this JSON data, do
//
//     final listCategory = listCategoryFromJson(jsonString);

import 'dart:convert';

ListCategory listCategoryFromJson(String str) => ListCategory.fromJson(json.decode(str));

String listCategoryToJson(ListCategory data) => json.encode(data.toJson());

class ListCategory {
    bool status;
    List<DataCategory> data;

    ListCategory({
        this.status,
        this.data,
    });

    factory ListCategory.fromJson(Map<String, dynamic> json) => ListCategory(
        status: json["status"],
        data: List<DataCategory>.from(json["data"].map((x) => DataCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DataCategory {
    String idx;
    String description;

    DataCategory({
        this.idx,
        this.description,
    });

    factory DataCategory.fromJson(Map<String, dynamic> json) => DataCategory(
        idx: json["idx"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "idx": idx,
        "description": description,
    };
}
