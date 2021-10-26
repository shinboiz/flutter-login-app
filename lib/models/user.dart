import 'package:login_app/models/codable.dart';

class User {
  final int userId;
  final String userName;
  final int age;

  User({
    required this.userId,
    required this.userName,
    required this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      userName: json['userName'],
      age: json['age'],
    );
  }
}

class UserEnDecoder extends Codable<User> {
  @override
  User fromJson(Map<String, dynamic> json) {
    return User.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
