class PomMasterDataModel {
    bool status;
    String erc;
    String err;
    List<DataPom> data;

    PomMasterDataModel({
        this.status,
        this.erc,
        this.err,
        this.data,
    });

    factory PomMasterDataModel.fromJson(Map<String, dynamic> json) => new PomMasterDataModel(
        status: json["status"],
        erc: json["erc"],
        err: json["err"],
        data: new List<DataPom>.from(json["data"].map((x) => DataPom.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "erc": erc,
        "err": err,
        "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DataPom {
    String pid;
    String code;
    String name;

    DataPom({
        this.pid,
        this.code,
        this.name,
    });

    factory DataPom.fromJson(Map<String, dynamic> json) => new DataPom(
        pid: json["pid"],
        code: json["code"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "pid": pid,
        "code": code,
        "name": name,
    };
}