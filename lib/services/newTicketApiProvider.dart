import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:semart_tech/helpers/clientApi.dart';
import 'package:semart_tech/models/attachmentModel.dart';
import 'package:semart_tech/models/commentModel.dart';
import 'package:semart_tech/models/newTicketModel.dart';

class NewTicketApiProvider {
  Dio api = new ClientApi().dio;

  Future<NewTicket> sendNewTicket(String token, String pom, 
      String idcat, String unit, String loc, String desc) async {
    try {
      FormData formData = FormData.from({
        'token': token,
        'pom': pom,
        'idcat': idcat,
        'unit': unit,
        'loc': loc,
        'desc': desc
      });
      api.options.contentType =
          ContentType.parse("application/x-www-form-urlencoded");
      //api.options.responseType = ResponseType.json;

      final response =
          await api.post('apitesting/ST/NewTicket3', data: formData);
      final responseDecode = json.decode(response.data);
      if (responseDecode["status"] == false) {
        return throw Exception("New ticket Failed" + responseDecode["err"]);
      } else {
        print(responseDecode);
        return responseDecode["data"];
      }
    } catch (ex) {
      return throw Exception("New ticket error");
    }
  }

  Future<CommentModel> sendComment(String token, String number, String user,
      DateTime time, String kind, String desc) async {
    try {
      FormData formData = FormData.from({
        'token': token,
        'number': number,
        'user': user,
        'time': time,
        'kind': kind,
        'desc': desc
      });
      api.options.contentType =
          ContentType.parse("application/x-www-form-urlencoded");

      final response = await api.post('apitesting/ST/Comment', data: formData);
      final responseDecode = json.decode(response.data);
      if (responseDecode["status"] == false) {
        return throw Exception("New comment Failed" + responseDecode["err"]);
      } else {
        print(responseDecode);
        return responseDecode;
      }
    } catch (ex) {
      return throw Exception("New Comment failed");
    }
  }

  Future<AttachmentModel> sendAttachment(String token, String number,
      String user, DateTime time, String kind, File url) async {
    try {
      FormData formData = new FormData();
      formData.add('token', token);
      formData.add('number', number);
      formData.add('user', user);
      formData.add('time', time);
      formData.add('kind', kind);
      formData.add('url', new UploadFileInfo(url, basename(url.path)));

      api.options.contentType =
          ContentType.parse("application/x-www-form-urlencoded");

      final response = await api.post('apitesting/ST/Picture', data: formData);
      final responseDecode = json.decode(response.data);
      if (responseDecode["status"] == false) {
        return throw Exception("New attachment Failed" + responseDecode["err"]);
      } else {
        print(responseDecode);
        return responseDecode;
      }
    } catch (ex) {
      return throw Exception("New Attachment failed");
    }
  }
}
