class DataBilling {
  String id;
  String month;
  DateTime dueDate;
  String countDown;
  double total;
  String address;
  String resident;

  DataBilling(
      {this.id,
      this.month,
      this.dueDate,
      this.countDown,
      this.total,
      this.address,
      this.resident});

  factory DataBilling.fromJson(Map<String, dynamic> json) {
    return DataBilling(
        id: json['id'],
        month: json['month'],
        dueDate: DateTime.parse(json['dueDate']),
        countDown: json['countDown'],
        total: double.parse(json['total'].toString()),
        address: json['address'],
        resident: json['resident']);
  }
}
