class CustomerModel{
  bool status;
  String erc;
  String err;
  List<DataCustomer> data;

  CustomerModel({this.status,this.erc,this.err,this.data});

  factory CustomerModel.fromJson(Map<String,dynamic> json) => CustomerModel(
    status: json["status"],
    erc: json["erc"],
    err: json["err"],
    data: List<DataCustomer>.from(json["data"].map((x)=> DataCustomer.fromJson(x))),
  );

  Map<String,dynamic> toJson () => {
    "status" : status,
    "erc" : erc,
    "err" : err,
    "data" : List<dynamic>.from(data.map((x)=> x.toJson())),
  };
}

class DataCustomer{
  String id;
  String name;
  List<String> address;
  List<Phone> phone;
  List<String> email;

  DataCustomer({this.id,this.name,this.address,this.phone,this.email});

  factory DataCustomer.fromJson(Map<String,dynamic> json) => DataCustomer(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    phone: List<Phone>.from(json["phone"].map((x)=> Phone.fromJson(x))),
    email: json["email"],
  );

  Map<String,dynamic> toJson() => {
    "id" : id,
    "name" : name,
    "address" : address,
    "phone" : List<dynamic>.from(phone.map((x) => x.toJson())),
    "email" : email,
  };
}

class Phone{
  String pt;
  String no;

  Phone({this.pt,this.no});

  factory Phone.fromJson(Map<String,dynamic> json) => Phone(
    pt: json["pt"],
    no: json["no"],
  );

  Map<String,dynamic> toJson ()=>{
    "pt" : pt,
    "no" : no
  };
}