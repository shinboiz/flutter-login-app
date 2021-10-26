class Error {
  final int errorCode;
  final String description;

  Error({
    required this.errorCode,
    required this.description,
  });

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
      errorCode: json['errorCode'],
      description: json['description'],
    );
  }
}
