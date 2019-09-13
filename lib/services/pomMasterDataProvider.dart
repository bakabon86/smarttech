import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:semart_tech/helpers/clientApi.dart';
import 'package:semart_tech/models/pomMasterDataModel.dart';
import 'package:semart_tech/helpers/global.dart';

class PomMasterDataProvider {
  Dio api = new ClientApi().dio;
  FlutterSecureStorage storage = FlutterSecureStorage();
  String token = appData.token;

  Future<List<DataPom>> getPOM() async {
    try {
      // api.options.contentType =
      //     ContentType.parse("application/x-www-form-urlencoded");
      //final tokenLogin = storage.read(key: 'token');
      final response = await api.post(
          'apitesting/ST/GetPOM?token=210a935e-5558-4ffa-8ff8-096243695838');

      final responseDecode = json.decode(response.data);
      print(responseDecode);
      List data = responseDecode['data'];
      return data.map((json) => DataPom.fromJson(json)).toList();
    } catch (ex) {
      return throw Exception("Get Data Pom Failed");
    }
  }

  Future<List<DataPom>> getPOMList() async {
    try {
      // api.options.contentType =
      //     ContentType.parse("application/x-www-form-urlencoded");
      String tokenLogin = await storage.read(key: 'token');
      print(tokenLogin);
     
        final response = await api
            .post('apitesting/ST/GetPOM?token=' + token);

        final responseDecode = json.decode(response.data);
        print(responseDecode);
        if (responseDecode['status']==true) {
          List data = responseDecode['data'];
          return data.map((json) => DataPom.fromJson(json)).toList();
        }
        return null;     
    } catch (ex) {
      return throw Exception("Get Data Pom Failed");
    }
  }

  
  Future<List<DataPom>> getPOMListName() async {
    try {
      // api.options.contentType =
      //     ContentType.parse("application/x-www-form-urlencoded");
      String tokenLogin = await storage.read(key: 'token');
      print(tokenLogin);
     
        final response = await api
            .post('apitesting/ST/GetPOM?token=' + token);

        final responseDecode = json.decode(response.data);
        //print(responseDecode);
        if (responseDecode['status']==true) {
          List data = new List();
          data = responseDecode['data'];
          //print(data);
          return data.map((json) => DataPom.fromJson(json)).toList();
        }           
        else{return [];}
    } catch (ex) {
      return throw Exception("Get Data Pom Failed");
    }
  }
}
