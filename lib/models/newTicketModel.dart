class NewTicket{
  bool status;
  String erc;
  String err;
  String number;

  NewTicket({this.status,this.erc,this.err,this.number});

  factory NewTicket.fromJson(Map<String,dynamic> json){
    return NewTicket(
      status: json['status'],
      erc: json['erc'],
      err: json['err'],
      number: json['number'],
    );
  }

   Map<String, dynamic> toJson() => {
        "status": status,
        "erc": erc,
        "err": err,
        "number": number,
    };

}