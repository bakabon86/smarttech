import 'dart:io';

import 'package:semart_tech/models/attachmentModel.dart';
import 'package:semart_tech/models/commentModel.dart';
import 'package:semart_tech/models/customerC1Model.dart';
import 'package:semart_tech/models/listBilling.dart';
import 'package:semart_tech/models/listCategory.dart';
import 'package:semart_tech/models/loginModel.dart';
import 'package:semart_tech/models/newTicketModel.dart';
import 'package:semart_tech/models/pomMasterDataModel.dart';
import 'package:semart_tech/models/listInstance.dart';
import 'package:semart_tech/models/response.dart';
import 'package:semart_tech/models/token.dart';
import 'package:semart_tech/services/billingProvider.dart';
import 'package:semart_tech/services/customerProvider.dart';
import 'package:semart_tech/services/instanceProvider.dart';
import 'package:semart_tech/services/loginApiProvider.dart';
import 'package:semart_tech/services/newTicketApiProvider.dart';
import 'package:semart_tech/services/pomMasterDataProvider.dart';
import 'package:semart_tech/services/categoryProvider.dart';

class Repository {
  LoginApiProvider login = LoginApiProvider();
  NewTicketApiProvider newTicketApiProvider = NewTicketApiProvider();
  PomMasterDataProvider pomMasterDataProvider = PomMasterDataProvider();
  BillingProvider billingProvider = BillingProvider();
  InstanceProvider instanceProvider = InstanceProvider();
  CategoryProvider categoryProvider = CategoryProvider();
  CustomerProvider customerProvider= CustomerProvider();

  Future<LoginModel> doLogin(String user, String pass) =>
      login.doLogin(user, pass);

  Future<CheckMobileNo> doCheck(String mobileNo) =>
      login.doCheckMobile(mobileNo);
  Future<Token> doLoginC1(String mobileNo, String password) =>
      login.doLoginC1(mobileNo, password);

  Future<NewTicket> sendNewTicket(String token, String pom, 
          String idcat, String unit, String loc, String desc) =>
      newTicketApiProvider.sendNewTicket(
          token, pom, idcat, unit, loc, desc);

  Future<CustomerC1Model> getCust() => customerProvider.getCust();
 
  Future<CommentModel> sendComment(String token, String number, String user,
          DateTime time, String kind, String desc) =>
      newTicketApiProvider.sendComment(token, number, user, time, kind, desc);

  Future<AttachmentModel> sendAttachment(String token, String number,
          String user, DateTime time, String kind, File url) =>
      newTicketApiProvider.sendAttachment(token, number, user, time, kind, url);

  Future<List<DataPom>> getPOM() => pomMasterDataProvider.getPOM();
  Future<List<DataPom>> getPOMList() => pomMasterDataProvider.getPOMList();

  Future<List<DataPom>> getPOMListName() =>
      pomMasterDataProvider.getPOMListName();
  Future<List<DataCategory>> getCategory(String idParent) =>
      categoryProvider.getCategory(idParent);

  Future<List<DataBilling>> getList(
          int page, String house, String status, int row, String otype) =>
      billingProvider.getBilling(page, house, status, row, otype);

  Future<List<Datum>> getInstance() => instanceProvider.getInstance();
}
