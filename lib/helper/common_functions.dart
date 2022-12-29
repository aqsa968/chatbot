// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CommonFunctions {

 static String? validateDefaultTxtField(String? value) {
    if (GetUtils.isBlank(value)!) {
      return "Field required";
    } else {
      return null;
    }
  }

//   static String convertDateFormat(String stringDate) {
//     DateTime inputDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(stringDate);
//     String outputDate = DateFormat('dd MMM, yyyy').format(inputDate);
//     return outputDate;
//   }

  // static String convertTimeFormat(String stringDate) {
  //   print(stringDate);
  //   DateTime inputDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(stringDate);
  //   String outputDate = DateFormat('hh:mm a').format(inputDate);
  //   return outputDate;
  // }

//   static String convertDateFormat2(String stringDate) {
//     DateTime inputDate = DateFormat('MM/dd/yyyy HH:mm').parse(stringDate);
//     String outputDate = DateFormat('dd MMM, yyyy').format(inputDate);
//     return outputDate;
//   }
//
  static String convertTimeFormat(String stringDate) {
    try {
      DateTime inputDate = DateFormat('MM-dd-yyyy HH:mm:ss').parse(stringDate);
      String outputDate = DateFormat('hh:mm a').format(inputDate);
      return outputDate;
    } catch (e) {
      return stringDate;
    }
  }

  static String convertTimeFormat2(String stringDate) {
    try {
      DateTime inputDate = DateFormat('MM-dd-yyyy HH:mm:ss').parse(stringDate);
      String outputDate = DateFormat('dd/MM').format(inputDate);
      return outputDate;
    } catch (e) {
      return stringDate;
    }
  }

  static String convertDateFormat(String stringDate) {
    try {
      DateTime inputDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(stringDate);
      String outputDate = DateFormat('MM/dd').format(inputDate);
      return outputDate;
    }catch (e) {
      return stringDate;
    }
  }

  static String convertDateFormat2(String stringDate) {
    try {
      DateTime inputDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(stringDate);
      String outputDate = DateFormat('yyyy-MM-dd').format(inputDate);
      return outputDate;
    }catch (e) {
      return stringDate;
    }
  }




  static void closeKeyboard() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  static void changeStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xffF9FAFC), //onlyForAndroid
        statusBarIconBrightness: Brightness.dark, //onlyForAndroid
        statusBarBrightness: Brightness.light, //onlyForIOS
      ),
    );
  }
}
