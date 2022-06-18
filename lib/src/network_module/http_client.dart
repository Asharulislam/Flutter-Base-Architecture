// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dang/src/network_module/api_base.dart';
import 'package:dang/src/network_module/api_exceptions.dart';
import 'package:dang/src/sources/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  HttpClient._();
  static final HttpClient _singleton = HttpClient._();

  static HttpClient get instance => _singleton;

  //General Get Request
  Future<dynamic> fetchData(
    String url, {
    Map<String, String>? params,
    Map<String, String>? headers,
  }) async {
    var responseJson;

    var uri = APIBase.baseURL +
        url +
        ((params != null) ? queryParameters(params) : "");
    var parsedUrl = Uri.parse(uri);

    try {
      final response = await http
          .get(
            parsedUrl,
            headers: this.headers(headers),
          )
          .timeout(
            const Duration(seconds: 15),
          );
      print(response.body.toString());
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  //General Post Request
  Future<dynamic> postData(
    String url,
    dynamic body, {
    Map<String, String>? params,
    Map<String, String>? headers,
  }) async {
    var responseJson;

    var uri = APIBase.baseURL +
        url +
        ((params != null) ? queryParameters(params) : "");
    var parsedUrl = Uri.parse(uri);

    try {
      final response = await http.post(
        parsedUrl,
        body: body,
        headers: this.headers(headers),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  //General Put Request
  Future<dynamic> putData(
    String url,
    dynamic body, {
    Map<String, String>? params,
    Map<String, String>? headers,
  }) async {
    var responseJson;
    var uri = APIBase.baseURL +
        url +
        ((params != null) ? queryParameters(params) : "");
    var parsedUrl = Uri.parse(uri);

    try {
      final response = await http.put(
        parsedUrl,
        body: body,
        headers: this.headers(headers),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  //General Delete Request
  Future<dynamic> deleteData(
    String url, {
    Map<dynamic, dynamic>? body,
    Map<String, String>? params,
    Map<String, String>? headers,
  }) async {
    var responseJson;
    var uri = APIBase.baseURL +
        url +
        ((params != null) ? queryParameters(params) : "");
    var parsedUrl = Uri.parse(uri);

    try {
      final response = await http.delete(
        parsedUrl,
        body: body,
        headers: this.headers(headers),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // Query Parameters
  String queryParameters(Map<String, String>? params) {
    if (params != null) {
      final jsonString = Uri(queryParameters: params);
      return '?${jsonString.query}';
    }
    return '';
  }

  // Customs headers would append here or return the default values
  Map<String, String> headers(Map<String, String>? headers) {
    var header = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
    };

    if (SharedPreferenceManager.sharedInstance.hasToken()) {
      header.putIfAbsent("Authorization",
          () => "${SharedPreferenceManager.sharedInstance.getToken()}");
    }

    if (headers != null) {
      header.addAll(headers);
    }
    return header;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw NotFoundRequestException(response.body.toString());
      case 408:
        throw RequestTimeOutException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
