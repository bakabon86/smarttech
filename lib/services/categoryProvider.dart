import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:semart_tech/helpers/global.dart';
import 'package:semart_tech/models/listCategory.dart';
import 'package:semart_tech/helpers/clientApi.dart';

class CategoryProvider {
  Dio api = new ClientApi().dio;
  String token = appData.token;

  Future<List<DataCategory>> getCategory(String idParent) async {
    try {
      String url;
      if (idParent == ''){
        url = 'apitesting/ST/GetSimpcat?token=' + token + '&idparent=';
      }
      else{
        url = 'apitesting/ST/GetSimpcat?token=' + token + '&idparent=' + idParent;
      }
      final response = await api.post(url);
      final responseDecode = json.decode(response.data);

      if (responseDecode["status"] == true) {
        List data = new List();
        data = responseDecode["data"];
        print(data);
        return data.map((f) => DataCategory.fromJson(f)).toList();
      }
      else{return [];}
    } catch (ex) {
      return throw Exception("Get Category Failed");
    }
  }
}
