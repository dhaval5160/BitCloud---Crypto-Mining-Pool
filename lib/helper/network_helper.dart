import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cloud_mining_farm/helper/exception_handler.dart';
import 'package:cloud_mining_farm/theme/config.dart';
import 'package:cloud_mining_farm/utils/utils.dart';
import 'package:http/http.dart' as http;

class NetworkAPICall {
  static final NetworkAPICall _networkAPICall = NetworkAPICall._internal();

  factory NetworkAPICall() => _networkAPICall;

  NetworkAPICall._internal();

  static const Duration _timeoutDuration = Duration(seconds: 30);

  Future<dynamic> get(String url, {Map<String, String>? header, bool isToken = true}) async {
    final client = http.Client();
    final String fullURL = AppConfig.baseUrlNew + url;
    try {
      final response =
          await client.get(Uri.parse(fullURL), headers: header).timeout(_timeoutDuration);
      return _checkResponse(response);
    } on TimeoutException {
      AppException.showException(
        AppException(
          message: 'Request timed out. Please check your internet connection and try again.',
          errorCode: 408,
          tag: 'TimeoutException',
        ),
      );
      return null;
    } on SocketException catch (e) {
      AppException.showException(
        AppException(
          message: 'No internet connection. Please check your network settings.',
          errorCode: e.osError?.errorCode ?? 0,
          tag: 'SocketException',
        ),
      );
      return null;
    } catch (e, st) {
      AppException.showException(e, st);
      return null;
    } finally {
      client.close();
    }
  }

  Future<dynamic> post(String url, dynamic body, {Map<String, String>? header}) async {

    final client = http.Client();

    // final String fullURL = 'https://phpstack-1523405-5863754.cloudwaysapps.com/bitcoin_dhaval/btc/$url';
    final String fullURL = AppConfig.baseUrlNew + url;
    try {
      final response = await client
          .post(Uri.parse(fullURL), body: body, headers: header)
          .timeout(_timeoutDuration);
      return _checkResponse(response);
    } on TimeoutException {
      AppException.showException(
        AppException(
          message: 'Request timed out. Please check your internet connection and try again.',
          errorCode: 408,
          tag: 'TimeoutException',
        ),
      );
      rethrow;
    } on SocketException catch (e) {
      AppException.showException(
        AppException(
          message: 'No internet connection. Please check your network settings.',
          errorCode: e.osError?.errorCode ?? 0,
          tag: 'SocketException',
        ),
      );
      rethrow;
    } catch (e, st) {
      AppException.showException(e, st);
      rethrow;
    } finally {
      client.close();
    }
  }

  dynamic _checkResponse(http.Response response) {
    try {
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          throw AppException(message: 'Response body is empty', errorCode: 0);
        }
        final decrypted = decryptAESCryptoJS(json.decode(response.body));
        return json.decode(decrypted);
      } else {
        if (response.body.isEmpty) {
          throw AppException(
              message: 'We couldn’t load your data. Please try again shortly.',
              errorCode: response.statusCode);
        }
        final Map<String, dynamic> data = jsonDecode(response.body);
        throw AppException(
          message: data['message'] ??
              data['error_description'] ??
              "Error: ${data['Error'] ?? 'Unknown API Error'}",
          errorCode: response.statusCode,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
/*
  dynamic checkResponse(http.Response response) {
    try {
      switch (response.statusCode) {
        case 200:
          try {
            if (response.body.isEmpty) {
              throw AppException(message: 'Response body is empty', errorCode: 0);
            }
            final send = AppConfig.decryptAESCryptoJS(json.decode(response.body));
            return json.decode(send);
          } catch (e) {
            rethrow;
          }
        default:
          try {
            if (response.body.isEmpty) {
              throw AppException(
                message: 'Response body is empty',
                errorCode: response.statusCode,
              );
            }
            final Map<String, dynamic> data = jsonDecode(response.body);
            throw AppException(
                message: "error : ${data['Error']}", errorCode: response.statusCode);
          } catch (e) {
            rethrow;
          }
      }
    } catch (e) {
      rethrow;
    }
  }
*/
}
