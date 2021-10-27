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
}
