import 'dart:convert';
import 'package:azyan/collctionReportModel.dart';
import 'package:azyan/invoicModel.dart';
import 'package:azyan/updateModel.dart';
import 'package:dio/dio.dart';
import 'package:azyan/changePasswordModel.dart';
import 'package:azyan/forgotPasswordModel.dart';
import 'package:azyan/model.dart';
import 'package:azyan/paymentPageModel.dart';
import 'package:azyan/profileModel.dart';
import 'package:azyan/schemeDetailsModel.dart';
import 'package:azyan/schemeModel.dart';
import 'package:azyan/sendOtpModel.dart';
import 'package:azyan/tempData.dart';
import 'package:azyan/transactionHistoyModel.dart';
import 'package:azyan/verifyPhoneModel.dart';

class HttpService {
  static Dio _dio = Dio();
  static final baseUrl =
      "https://login2.in/azyan/index.php/CustomerApi/";

  static Future login(uanemVar, pass,firebaseToken) async {
    var params = {
      "mobNumber": uanemVar,
      "password": pass,
      "firebaseToken": firebaseToken,
    };
    try {
      var result = await _dio.get(baseUrl + "login", queryParameters: params);
      RersultModel model = RersultModel.fromJson(result.data);
print(params);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future profile(token) async {
    var params = {
      "token": token,
    };
    try {
      var result =
          await _dio.get(baseUrl + "customer_profile", queryParameters: params);

      ProfileModel model = ProfileModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future listSchemes(token) async {
    var params = {
      "token": token,
    };
    try {
      var result =
          await _dio.get(baseUrl + "view_scheme", queryParameters: params);

      ListSchemeModel model = ListSchemeModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future schemeDetails(customerSchemeMasterId) async {
    var params = {
      "customerSchemeMasterId": customerSchemeMasterId,
    };
    try {
      var result = await _dio.get(baseUrl + "view_scheme_details",
          queryParameters: params);

      SchemeDetailsList model = SchemeDetailsList.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future paymentDetails(tocken, customerSchemeMasterId) async {
    var params = {
      "token": tocken,
      "customerSchemeMasterId": customerSchemeMasterId,
    };
    try {
      var result = await _dio.get(baseUrl + "payment", queryParameters: params);

      PaymnetDetails model = PaymnetDetails.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future changePassword(tocken, confirmPassword) async {
    var params = {
      "token": tocken,
      "password": confirmPassword,
    };
    try {
      var result =
          await _dio.get(baseUrl + "reset_password", queryParameters: params);

      ChangePasswordModel model = ChangePasswordModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future verifyPhonenumber(phoneNumber) async {
    var params = {
      "phoneNumber": phoneNumber,
    };
    try {
      var result = await _dio.get(baseUrl + "varify_phoneNumber",
          queryParameters: params);

      VerifyPhoneModel model = VerifyPhoneModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future forgotPassword(phoneNumber, confirmPassword) async {
    var params = {
      "phoneNumber": phoneNumber,
      "password": confirmPassword,
    };
    try {
      var result =
          await _dio.get(baseUrl + "forgot_password", queryParameters: params);

      ForgotPasswordModel model = ForgotPasswordModel.fromJson(result.data);
//print(model);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future sendOtp(mobile,otp,appSignature) async {
    var params = {
      "mobile": mobile,
      "otp": otp,
      "app_signature":appSignature
    };
    try {
      var result =
      await _dio.get(baseUrl + "send_otp", queryParameters: params);
      print(result);

      SendOtpModel model = SendOtpModel.fromJson(result.data);
//print(model);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future tempDataStore(body) async {
    print(body);
    var params = {
      "data": body,
    };
    try {
      var result =
          await _dio.post(baseUrl + "addPayment", data: jsonEncode(body));
      print(body);
      print(result);
      TempData model = TempData.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future invoice(tempId) async {
    var params = {
      "temp_id": tempId,
    };
    try {
      var result =
      await _dio.get(baseUrl + "get_invoice", queryParameters: params);
      print(result);

      InvoiceModel model = InvoiceModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
  static Future collectionReport(tocken) async {
    var params = {
      "token": tocken,
    };
    try {
      var result =
      await _dio.get(baseUrl + "transaction_history", queryParameters: params);
      print(params);
      print(result);


      CollectionReportModel model = CollectionReportModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future forceUpdate() async {

    try {
      var result = await _dio.get(baseUrl + "app_update");
      print(result);

      UpdateModel model = UpdateModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future transcationHistory(userId) async {
    var params = {
      "userId": userId,
    };
    try {
      var result = await _dio.get(baseUrl + "transaction_historty",
          queryParameters: params);

      TransationHistory model = TransationHistory.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }
}
