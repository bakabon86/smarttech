import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:semart_tech/helpers/clientApi.dart';
import 'package:semart_tech/helpers/global.dart';
import 'package:semart_tech/models/loginModel.dart';
import 'package:semart_tech/models/token.dart';
import 'package:semart_tech/models/bodyRequest.dart';
import 'package:semart_tech/models/response.dart';
import 'dart:convert';
import 'package:semart_tech/helpers/appSetting.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginApiProvider {
  Dio api = new ClientApi().dio;

  Future<LoginModel> doLogin(String user, String pass) async {
    final storage = new FlutterSecureStorage();

    try {
      //BodyRequest body = BodyRequest(user: user, pass: pass);
      //final token = await api.post('apitesting/ST/Login',
      //options: Options(contentType: ContentType.json),
      //    options: Options(contentType: ContentType.parse("application/x-www-form-urlencoded")),
      //    data: json.encode(body));

      api.options.contentType =
          ContentType.parse("application/x-www-form-urlencoded");

      final token =
          await api.post('apitesting/ST/Login?user=' + user + '&pass=' + pass);
      final tokenDecode = LoginModel.fromJson(json.decode(token.data));

      appData.token = tokenDecode.token;
      print('Token=$token');
      if (tokenDecode.status == false) {
        AlertDialog(
          content: Text('Login Failed' + tokenDecode.err),
        );
        return throw Exception("Login Failed" + tokenDecode.err);
      } else {
        String x = tokenDecode.token;
        print('TokenDecode=$x');
        await storage.write(key: 'token', value: tokenDecode.token);
        return tokenDecode;
      }
    } catch (ex) {
      return throw Exception("Login Error");
    }
  }

  Future<Token> doLoginC1(String mobileNo, String password) async {
    final storage = new FlutterSecureStorage();

    try {
      BodyRequest body = BodyRequest(username: mobileNo, password: password);
      final token = await api.post('api/account/residents/login',
          options: Options(contentType: ContentType.json),
          data: json.encode(body));
      final tokenDecode = Token.fromJson(json.decode(token.data));
      await storage.write(key: 'token', value: tokenDecode.accessToken);
      appData.token =  tokenDecode.accessToken;
      return tokenDecode;
    } catch (ex) {
      return throw Exception("Login Failed");
    }
  }

  Future<CheckMobileNo> doCheckMobile(String mobileNo) async {
    final result = await api.post(app.baseUrl +
        'api/account/residents/checkmobile?mobile_no=' +
        mobileNo);
    final resultDecode = json.decode(result.data);
    return CheckMobileNo.fromJson(resultDecode);
  }

}
