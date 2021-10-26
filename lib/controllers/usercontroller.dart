import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';
import '../models/error.dart';
// ignore: library_prefixes
import '../utils/errorcodes.dart' as ErrorCode;

// Future<User> getUserByUserNamePassword(String username, String password) async {
//   final response = await http
//       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return User.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

void getUserByUserNamePassword(String username, String password,
    ValueSetter<User> success, ValueSetter<Error> failure) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  try {
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final user = User.fromJson(jsonDecode(response.body));
      success(user);
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
