// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:login_app/controllers/apimanager.dart';
import 'package:login_app/models/user.dart';
import 'package:login_app/models/error.dart';
import 'package:login_app/utils/crypto.dart' as CryptoUtils;

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

// get user by username and password
// params:
// ** username
// ** password
// ** success: callback when succeed
// ** failure: callback when error occurred
void getUserByUserNamePassword(String username, String password,
    ValueSetter<User> success, ValueSetter<Error> failure) {
  Map<String, dynamic> params = {
    'username': username,
    'password': CryptoUtils.hash(password), // Secure user password
  };
  ApiManager().postRequest<User>(
      ApiManager().loginAPI, {}, params, UserSerializer(), success, failure);
}
