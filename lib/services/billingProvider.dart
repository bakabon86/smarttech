import 'package:dio/dio.dart';


import 'package:semart_tech/helpers/clientApi.dart';
import 'package:semart_tech/models/listBilling.dart';
import 'dart:convert';

class BillingProvider {
  Dio api = new ClientApi().dio;
 
  Future<List<DataBilling>> getBilling(
      int page, String house, String status, int row, String otype) async {
    try {
      final result = await api.get(
          'api/invoice/Get/' +
          page.toString() +
          '/' +
          row.toString() +
          '/' +
          house +
          '/' +
          status +
          '/' +
          otype);
      final resultDecode = json.decode(result.data);
      List data = resultDecode['data'];
      return data.map((x) => DataBilling.fromJson(x)).toList();
    } catch (ex) {
      return throw Exception("Failed Get Data Billing");
    }
  }
}
