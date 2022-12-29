
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:chatbot/helper/urls.dart';
import 'package:chatbot/widgets/getx_helper.dart';
import 'package:http/http.dart' as http;

import 'errors.dart';
import 'global_variables.dart';

class ApiBaseHelper {
  final String _baseUrl = Urls.baseURL;
  final String token = GlobalVariable.token;

  Future<dynamic> postMethod({required String url, dynamic body}) async {
    Map<String, String> header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };

    try {
      body = jsonEncode(body);
      Uri urlValue = Uri.parse(_baseUrl + url);
      http.Response response = await http
          .post(urlValue, headers: header, body: body)
          .timeout(Duration(seconds: 30));

      print('hayat');
      print(response.body);

      Map<String, dynamic> parsedJSON = jsonDecode(response.body);
      print(
          '*********************** Response **********************************');
      print(urlValue.toString());
      print('body => ' + body);
      print(parsedJSON);
      print(
          '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&\n');
      return parsedJSON;
    } on SocketException catch (_) {
      GlobalVariable.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.noInternetError);
      throw Errors.noInternetError;
    } on TimeoutException catch (_) {
      GlobalVariable.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.timeOutException);
      throw Errors.timeOutException;
    } on FormatException catch (_) {
      GlobalVariable.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.formatException);
      throw Errors.formatException;
    } catch (e) {
      GlobalVariable.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.generalApiError);
      throw e.toString();
    }
  }

  Future<dynamic> getMethod({required String url}) async {
    Map<String, String> header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };

    try {
      Uri urlValue = Uri.parse("https://dealersgearcrm.com/api/" + url);
      print(urlValue);
      http.Response response = await http
          .get(urlValue, headers: header)
          .timeout(Duration(seconds: 50));

      Map<String, dynamic> parsedJSON = jsonDecode(response.body);
      print(
          '*********************** Response **********************************');
      print(urlValue.toString());
      print(parsedJSON);
      print(
          '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&\n');
      return parsedJSON;
    } on SocketException {
      GlobalVariable.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.noInternetError);
      throw Errors.noInternetError;
    } on TimeoutException {
      GlobalVariable.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.timeOutException);
      throw Errors.timeOutException;
    }  catch (e) {
      GlobalVariable.showLoader.value = false;
      print(e);
      GetxHelper.showSnackBar(title: 'Error', message: e.toString());
      throw e.toString();
    }
  }

  Future<dynamic> postMethodForImage(
      {required String url,
      required List<http.MultipartFile> files,
      required Map<String, String> fields}) async {
    try {
      Uri urlValue = Uri.parse(Urls.baseURL + url);
      http.MultipartRequest request = http.MultipartRequest('POST', urlValue);
      request.headers['Authorization'] = token;
      request.fields.addAll(fields);
      request.files.addAll(files);
      http.StreamedResponse response = await request.send();
      Map<String, dynamic> parsedJson =
          await jsonDecode(await response.stream.bytesToString());

      print(
          '*********************** Response **********************************');
      print(urlValue.toString());
      print(parsedJson.toString());
      print(
          '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&\n');
      return parsedJson;
    } on SocketException catch (_) {
      GlobalVariable.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.noInternetError);
      throw Errors.noInternetError;
    } on TimeoutException catch (_) {
      GlobalVariable.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.timeOutException);
      throw Errors.timeOutException;
    } on FormatException catch (_) {
      GlobalVariable.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.formatException);
      throw Errors.formatException;
    } catch (e) {
      GlobalVariable.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.generalApiError);
      throw e.toString();
    }
  }

  //base URL is changed...
  Future<dynamic> vinGetMethod({required String url}) async {
    Map<String, String> header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };

    try {
      Uri urlValue = Uri.parse(url);
      http.Response response = await http
          .get(urlValue, headers: header)
          .timeout(Duration(seconds: 30));

      print(response.body);

      Map<String, dynamic> parsedJSON = jsonDecode(response.body);
      print(
          '********************** Response *********************************');
      print(urlValue.toString());
      print(parsedJSON);
      print(
          '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&\n');
      return parsedJSON;
    } on SocketException {
      GlobalVariable.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.noInternetError);
      throw Errors.noInternetError;
    } on TimeoutException {
      GlobalVariable.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.timeOutException);
      throw Errors.timeOutException;
    } on FormatException {
      GlobalVariable.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.formatException);
      throw Errors.formatException;
    } catch (e) {
      GlobalVariable.showLoader.value = false;
      GetxHelper.showSnackBar(title: 'Error', message: Errors.generalApiError);
      throw e.toString();
    }
  }

//   Future<dynamic> getMethod({required String url}) async {
//
//     try {
//       Map<String, String> header = {'Authorization': token};
//       Uri urlValue = Uri.parse(_baseUrl + url);
//             http.Response response = await http.get(urlValue, headers: header).timeout(Duration(seconds: 30));
//             print(response.body);
//       var parsedJSON = jsonDecode(response.body);
//
//       log('*********************** Response **********************************');
//       log(urlValue.toString());
//       log(response.body);
//       return parsedJSON;
//
//     } on SocketException catch (_) {
//       GlobalVariable.showLoader.value = false;
//       GetxHelper.showSnackBar1(title: 'Error', message: Errors.noInternetError);
//       throw Errors.noInternetError;
//     } on TimeoutException catch (_) {
//       GlobalVariable.showLoader.value = false;
//       GetxHelper.showSnackBar1(title: 'Error', message: Errors.generalApiError);
//       throw Errors.generalApiError;
//     } on FormatException catch (_) {
//       GlobalVariable.showLoader.value = false;
//       GetxHelper.showSnackBar1(title: 'Error', message: Errors.generalApiError);
//       throw Errors.generalApiError;
//     } catch (e) {
//       GlobalVariable.showLoader.value = false;
//       GetxHelper.showSnackBar1(title: 'Error', message: Errors.generalApiError);
//       throw e.toString();
//     }
//   }
//
//
//   Future<dynamic> patchMethod({required String url, dynamic body, bool isFormData = false}) async {
//     Map<String, String> header = {
//       'Authorization': token,
//       'Content-Type': (!isFormData) ? 'application/json' : 'application/x-www-form-urlencoded'
//     };
//     if (!isFormData) {
//       body = json.encode(body);
//     }
//     try {
//       Uri urlValue = Uri.parse(_baseUrl + url);
//       http.Response response = await http.patch(urlValue, headers: header, body: body).timeout(Duration(seconds: 30));
//       Map<String, dynamic> parsedJSON = jsonDecode(response.body);
//       log('*********************** Response **********************************');
//       log(urlValue.toString());
//       log(parsedJSON.toString());
//       return parsedJSON;
//     } on SocketException catch (_) {
//       GlobalVariable.showLoader.value = false;
//       GetxHelper.showSnackBar1(title: 'Error', message: Errors.noInternetError);
//       throw Errors.noInternetError;
//     } on TimeoutException catch (_) {
//       GlobalVariable.showLoader.value = false;
//       GetxHelper.showSnackBar1(title: 'Error', message: Errors.timeOutException);
//       throw Errors.timeOutException;
//     } on FormatException catch (_) {
//       GlobalVariable.showLoader.value = false;
//       GetxHelper.showSnackBar1(title: 'Error', message: Errors.formatException);
//       throw Errors.formatException;
//     } catch (e) {
//       GlobalVariable.showLoader.value = false;
//       GetxHelper.showSnackBar1(title: 'Error', message: Errors.generalApiError);
//       throw e.toString();
//     }
//   }
}
