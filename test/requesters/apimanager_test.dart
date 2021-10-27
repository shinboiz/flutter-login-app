// ignore_for_file: library_prefixes

import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as Http;
import 'package:login_app/models/user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:login_app/requesters/apimanager.dart';
import 'package:login_app/models/error.dart';
import 'apimanager_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([Http.Client])
void main() {
  group('postRequest', () {
    test(
        'login - returns an User object if the http call completes successfully',
        () async {
      final client = MockClient();
      final success = Completer<User>();
      final failure = Completer<Error>();
      final Map<String, String> headerParams = {};
      final Map<String, dynamic> bodyParams = {};

      const userJson = {
        "userId": "abc12345678",
        "userName": "Tester",
        "age": 60
      };
      final userObject = UserSerializer().fromJson(userJson);

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.post(Uri.parse(ApiManager().endpoint + ApiManager().loginAPI),
              headers: ApiManager().requestHeaders(headerParams),
              body: ApiManager().requestBody(bodyParams)))
          .thenAnswer((_) async => Http.Response(json.encode(userJson), 200));

      ApiManager().postRequest_<User>(
          client,
          ApiManager().loginAPI,
          headerParams,
          bodyParams,
          UserSerializer(),
          success.complete,
          failure.complete);

      expect(failure.isCompleted, isFalse);
      expect(await success.future, equals(userObject));
    });

    test(
        'login - return an Error object if the http call completes with an error',
        () async {
      final client = MockClient();
      final success = Completer<User>();
      final failure = Completer<Error>();
      final Map<String, String> headerParams = {};
      final Map<String, dynamic> bodyParams = {};

      const errorJson = {"errorCode": 404, "message": "Not Found"};
      final errorObject = ErrorSerializer().fromJson(errorJson);

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.post(Uri.parse(ApiManager().endpoint + ApiManager().loginAPI),
              headers: ApiManager().requestHeaders(headerParams),
              body: ApiManager().requestBody(bodyParams)))
          .thenAnswer((_) async =>
              Http.Response(json.encode(errorJson), errorObject.errorCode));

      ApiManager().postRequest_<User>(
          client,
          ApiManager().loginAPI,
          headerParams,
          bodyParams,
          UserSerializer(),
          success.complete,
          failure.complete);

      expect(await failure.future, equals(errorObject));
    });
  });
}
