//import 'dart:convert';
//import 'dart:io';

import 'package:dio/dio.dart';
//import 'global.dart';
import 'appSetting.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'global.dart';

class ClientApi {
  FlutterSecureStorage storage;
  Dio dio;
  String  token = appData.token;

  ClientApi() {
    BaseOptions options = BaseOptions(      
      //baseUrl: app.baseUrl,
      baseUrl: app.smartTechUrl,
      connectTimeout: 60000,
      receiveTimeout: 90000,
      responseType: ResponseType.plain,
    );
    dio = new Dio(options);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        // if (!options.uri.toString().contains('checkmobile') &&
        //     !options.uri.toString().contains('/login'))
        //    options.headers['Authorization'] = 'Bearer ' + appData.token;
        // request.contentType =
        //     ContentType.parse("application/x-www-form-urlencoded");
        return options;
      },
      onResponse: (Response response) {
        if (response.statusCode == 200){          
            return response; //
        }          
        else
          return DioError(error: DioErrorType.RESPONSE);
      },
      onError: (DioError e) async {
        if (e.message.contains('401'))
          return DioError(
              error: DioErrorType.RESPONSE, message: "Unauthorized");
        return e;
      },
    ));
  }
}
