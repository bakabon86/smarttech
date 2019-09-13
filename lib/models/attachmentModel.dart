class AttachmentModel{
  bool status;
  String erc;
  String err;
  List<String> data;

  AttachmentModel({this.status,this.erc,this.err,this.data});

  factory AttachmentModel.fromJson(Map<String,dynamic> json) => AttachmentModel(
      status: json["status"],
      erc: json["erc"],
      err: json["err"],
      data: json["data"],
  );

  Map<String,dynamic> toJson () => {
    "status" : status,
    "erc" : erc,
    "err": err,
    "data" : data,
  };
}