import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:login_app/models/user.dart';
import 'package:login_app/models/error.dart';
import 'package:login_app/models/codable.dart';
// ignore: library_prefixes
import '../utils/errorcodes.dart' as ErrorCode;

class ApiManager {
  static final ApiManager _singleton = ApiManager._internal();

  factory ApiManager() {
    return _singleton;
  }

  ApiManager._internal();

  String endpoint = "https://localhost:5001";

  final loginAPI = "/Login";

  void postRequest<T>(
      String apiPath,
      Map<String, dynamic> params,
      Codable<T> codable,
      ValueSetter<T> success,
      ValueSetter<Error> failure) async {
    final response = await http.post(Uri.parse(endpoint + apiPath));

    try {
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        final anObject = codable.fromJson(jsonDecode(response.body));
        success(anObject);
      } else {
        // If the server did not return a 200 OK response,
        final error = Error.fromJson(jsonDecode(response.body));
        failure(error);
      }
    } catch (error) {
      failure(Error(
          errorCode: ErrorCode.CLIENT_ERROR, description: error.toString()));
    }
  }
}
