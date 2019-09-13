class CommentModel{
  bool status;
  String erc;
  String err;
  List<DataComment> data;

  CommentModel({this.status,this.erc,this.err,this.data});

  factory CommentModel.fromJson(Map<String,dynamic> json) => CommentModel(
      status: json["status"],
      erc: json["erc"],
      err: json["err"],
      data: List<DataComment>.from(json["data"].map((x)=> DataComment.fromJson(x))),
  );

  Map<String,dynamic> toJson () => {
    "status" : status,
    "erc" : erc,
    "err" : err,
    "data" : List<dynamic>.from(data.map((x)=> x.toJson())),
  };
}

class DataComment{
  DateTime time;
  String desc;

  DataComment({this.time,this.desc});

  factory DataComment.fromJson(Map<String,dynamic> json) => DataComment(
    time: json["time"],
    desc: json["desc"],
  );

  Map<String,dynamic> toJson () => {
    "time" : time,
    "desc" : desc,
  };
}