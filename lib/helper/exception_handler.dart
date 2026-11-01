import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppException implements Exception {
  final String message;
  final String? tag;
  final int errorCode;

  AppException({required this.message, required this.errorCode, this.tag});

  int getErrorCode() => errorCode;

  String getMessage() => message;

  String getMessageWithTag() => "${tag ?? 'No Tag'} : $message";

  String? getTag() => tag;

  @override
  String toString() => "$errorCode : ${tag ?? 'No Tag'} : $message";

  static void showException(dynamic exception, [dynamic stackTrace]) {
    if (exception is AppException) {
      exception.show();
    } else if (exception is SocketException) {
      String errorMessage;
      int errorCode;
      if (exception.message.contains('Failed host lookup')) {
        errorMessage = 'Cannot connect to the server. Check your internet connection.';
        errorCode = 503;
      } else if (exception.message.contains('Connection refused')) {
        errorMessage = 'Server is unreachable. Please try again later.';
        errorCode = 502;
      } else {
        errorMessage = 'Network error: ${exception.message}';
        errorCode = exception.osError?.errorCode ?? 500;
      }
      AppException(
        message: errorMessage,
        errorCode: errorCode,
        tag: "SocketException",
      ).show();
    } else if (exception is TimeoutException) {
      AppException(
        message: 'Operation timed out. Please try again.',
        errorCode: 408,
        tag: "TimeoutException",
      ).show();
    } else if (exception is HttpException) {
      AppException(
        message: "Couldn't find the requested data.",
        errorCode: 404,
        tag: "HttpException",
      ).show();
    } else if (exception is FormatException) {
      AppException(
        message: "The server response was in an unexpected format.",
        errorCode: 422,
        tag: "FormatException",
      ).show();
    } else {
      AppException(
        message: stackTrace?.toString() ?? "Unexpected error occurred.",
        errorCode: 500,
        tag: exception.runtimeType.toString(),
      ).show();
    }
  }

  void show() {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        'Error - $errorCode',
        message,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        borderRadius: 8,
        animationDuration: const Duration(milliseconds: 500),
        duration: const Duration(seconds: 4),
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
