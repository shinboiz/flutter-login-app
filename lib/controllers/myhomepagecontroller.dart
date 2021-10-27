// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:login_app/views/loginresultpage.dart';
import 'package:login_app/utils/constants.dart' as Constants;
import 'package:login_app/requesters/userrequester.dart' as UserRequester;

class MyHomePageController {
  bool isInputValid(String username, String password) {
    // This call to validate the input
    // If the input is qualified a True will be returned, or False otherwise
    return username.isNotEmpty && password.isNotEmpty;
  }

  void doLogin(String username, String passowrd, BuildContext context,
      ValueSetter<String> onStateChangeRequestWithError) {
    // This call to send request login to BE if the input is good

    // Reset error for another attempt
    onStateChangeRequestWithError("");

    if (isInputValid(username, passowrd)) {
      EasyLoading.show(status: Constants.LOADING);
      // Call login API
      UserRequester.getUserByUserNamePassword(username, passowrd, (user) {
        // Success case
        EasyLoading.dismiss();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoginResultPage(
                      user: user,
                    )));
      }, (error) {
        // Failure case
        EasyLoading.dismiss();
        onStateChangeRequestWithError(error.message);
      });
    } else {
      // Validation Falied
      onStateChangeRequestWithError(Constants.LOGIN_ERROR_EMPTY);
    }
  }
}
