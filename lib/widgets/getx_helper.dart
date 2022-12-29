import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxHelper {
  static void showSnackBar({required String title, required String message}) {
    Get.snackbar(title, message,
        colorText: Colors.white,
        backgroundColor: Colors.black,
        animationDuration: Duration(seconds: 1));
  }

  static void showProgressBar() {
    Get.dialog(
        Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            )),
        barrierDismissible: false);
  }

  static void closeProgressBar() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
