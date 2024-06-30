import 'package:curso_weincode/home/domain/user_model.dart';
import 'package:flutter/material.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Column(
            children: [
              const Text("Navigate to new Screen"),
              Text(user.name),
              Text(user.age.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
