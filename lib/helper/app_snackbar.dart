import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBar {
  static void showSnackBar({String message = "", required String title}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      borderRadius: 8,
      animationDuration: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 2),
      barBlur: 0,
      colorText: Colors.white,
      isDismissible: false,
      backgroundColor: Colors.black87,
    );
  }

  static void showErrorSnackBar({
    required String message,
    String title = 'Error',
  }) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        borderRadius: 8,
        animationDuration: const Duration(milliseconds: 500),
        duration: const Duration(seconds: 2),
        barBlur: 0,
        colorText: Colors.white,
        backgroundColor: Colors.red.shade700,
        shouldIconPulse: false,
        icon: const Icon(Icons.error_outline, color: Colors.white),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }
}
