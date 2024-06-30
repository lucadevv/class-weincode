import 'package:curso_weincode/config/routes/app_routes.dart';
import 'package:curso_weincode/home/domain/user_model.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  static const route = 'new-screen';
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserModel(name: 'Luis Carranza', age: 25);
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Page"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              AppRoutes.otherScreen,
              arguments: user,
            );
          },
          child: const Text("Navigate other screen"),
        ),
      ),
    );
  }
}
