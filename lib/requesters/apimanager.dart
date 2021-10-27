// ignore_for_file: library_prefixes

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'package:login_app/models/error.dart';
import 'package:login_app/models/serializer.dart';
import 'package:login_app/utils/errorcodes.dart' as ErrorCode;

// Api Manager
// configure endpoint
// define Web API paths
// template for http methods
class ApiManager {
  static final ApiManager _singleton = ApiManager._internal();

  factory ApiManager() {
    return _singleton;
  }

  ApiManager._internal();

  String endpoint = "https://localhost:5001";

  final loginAPI = "/Login/";

  final _client = Http.Client();

  // Post Request Template
  // T: model data type
  void postRequest<T>(
      String apiPath,
      Map<String, String> headerParams,
      Map<String, dynamic> bodyParams,
      Serializer<T> serializer,
      ValueSetter<T> success,
      ValueSetter<Error> failure) {
    postRequest_(_client, apiPath, headerParams, bodyParams, serializer,
        success, failure);
  }

  @visibleForTesting
  void postRequest_<T>(
      Http.Client client,
      String apiPath,
      Map<String, String> headerParams,
      Map<String, dynamic> bodyParams,
      Serializer<T> serializer,
      ValueSetter<T> success,
      ValueSetter<Error> failure) async {
    final Map<String, String> headers = requestHeaders(headerParams);
    final body = requestBody(bodyParams);

    try {
      final response = await client.post(
        Uri.parse(endpoint + apiPath),
        headers: headers,
        body: body,
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        final anObject = serializer.fromJson(jsonDecode(response.body));
        success(anObject);
      } else {
        // If the server did not return a 200 OK response,
        final error = Error.fromJson(jsonDecode(response.body));
        failure(error);
      }
    } catch (error) {
      failure(
          Error(errorCode: ErrorCode.CLIENT_ERROR, message: error.toString()));
    }
  }

  @visibleForTesting
  Map<String, String> requestHeaders(Map<String, String> headerParams) {
    final Map<String, String> headers = {};
    headers.addAll({"Content-Type": "application/json; charset=utf-8"});
    headers.addAll(headerParams);
    return headers;
  }

  @visibleForTesting
  String requestBody(Map<String, dynamic> bodyParams) {
    return json.encode(bodyParams);
  }
}
