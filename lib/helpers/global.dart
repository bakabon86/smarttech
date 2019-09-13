class MyGlobal {
  static final MyGlobal _instance = MyGlobal._internal();

  factory MyGlobal() => _instance;

  String token;
  String parentCategory;
  String childCategory;
  String grandChildCategory;
  String pom;
  String cust;
  String idcat;
  String unit;
  String loc;
  String desc;
  String number;
  String user;
  DateTime time;
  String kind;
  String commentDesc;
  String url;

  MyGlobal._internal();
}

final appData = MyGlobal();
