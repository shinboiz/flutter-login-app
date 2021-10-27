import 'package:flutter/material.dart';
import 'package:login_app/models/user.dart';

class LoginResultPage extends StatelessWidget {
  const LoginResultPage({Key? key, required this.user}) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Result"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'User Information:\nUserId:${user.userId}\nUserName: ${user.userName}\nAge: ${user.age}',
            style: const TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
