// ignore_for_file: library_prefixes

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:login_app/utils/myhttp.dart';
import 'package:login_app/views/myhomepage.dart';
import 'package:login_app/utils/constants.dart' as Constants;

void main() {
  // Custom HttpOverrides to resolve handshake issue
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: Constants.LOGIN),
      builder: EasyLoading.init(),
    );
  }
}
