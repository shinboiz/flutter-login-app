import 'dart:convert';
import 'package:crypto/crypto.dart';

String hash(String text) {
  var bytes1 = utf8.encode(text); // data being hashed
  var digest1 = sha256.convert(bytes1); // Hashing Process
  return digest1.toString();
}
