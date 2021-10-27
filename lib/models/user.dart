import 'package:login_app/models/serializer.dart';

class User {
  final String userId;
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

class UserSerializer extends Serializer<User> {
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
