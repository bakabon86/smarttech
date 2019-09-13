import 'dart:convert';

import 'package:dio/dio.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:semart_tech/helpers/clientApi.dart';
import 'package:semart_tech/models/listInstance.dart';

class InstanceProvider{
  Dio api = new ClientApi().dio;
  //FlutterSecureStorage storage;

  Future<List<Datum>> getInstance() async {
    try {
      // api.options.contentType =
      //     ContentType.parse("application/x-www-form-urlencoded");
      //final tokenLogin = storage.read(key: 'token');
      // final response = await api.post('apitesting/ST/GetPOM?token=' +
      //     '5d69d001-ae81-42d4-acbc-7677e460a1dc&id=""' );
      final response = await api.post('master/repokind/list');
      //print(response);
            final responseDecode = json.decode(response.data);
            print(responseDecode);
            List data = responseDecode['data'];
            return data.map((json)=>Datum.fromJson(json)).toList();
    } catch (ex) {
      return throw Exception("Get Instance Failed" );
    }
  }
}