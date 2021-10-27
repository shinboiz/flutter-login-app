import 'package:login_app/models/serializer.dart';

class Error {
  final int errorCode;
  final String message;

  Error({
    required this.errorCode,
    required this.message,
  });

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
      errorCode: json['errorCode'],
      message: json['message'],
    );
  }

  @override
  bool operator ==(other) {
    return (other is Error) &&
        other.errorCode == errorCode &&
        other.message == message;
  }

  @override
  int get hashCode => errorCode.hashCode ^ message.hashCode;
}

class ErrorSerializer extends Serializer<Error> {
  @override
  Error fromJson(Map<String, dynamic> json) {
    return Error.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
