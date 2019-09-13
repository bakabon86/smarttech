import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:semart_tech/helpers/appSetting.dart';
import 'package:semart_tech/helpers/global.dart';
import 'package:semart_tech/models/customerC1Model.dart';
import 'package:semart_tech/helpers/clientApi.dart';

class CustomerProvider {
  Dio api = new ClientApi().dio;
  String token = appData.token;

  Future<CustomerC1Model> getCust() async {
    try {
      String url;
      url = app.baseUrl + "api/C1/GetCust";
      
       api.options.headers["Authorization"]= 'Bearer ' + appData.token;
      final response = await api.get(url);
      final responseDecode = json.decode(response.data);

      if (responseDecode["status"] == true) {
        return responseDecode;
      }
      else{return null;}
    } catch (ex) {
      return throw Exception("Get Customer Failed");
    }
  }
}
