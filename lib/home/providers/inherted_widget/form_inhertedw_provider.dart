import 'package:flutter/material.dart';

class FormInhertedWidget extends InheritedWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController userNameController;
  final Function onClickLogin;
  final Function validatorUserName;

  const FormInhertedWidget({
    super.key,
    required super.child,
    required this.formKey,
    required this.userNameController,
    required this.onClickLogin,
    required this.validatorUserName,
  });

  static FormInhertedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FormInhertedWidget>();
  }

  @override
  bool updateShouldNotify(FormInhertedWidget oldWidget) {
    return oldWidget.formKey.currentState!.validate() !=
        formKey.currentState!.validate();
  }
}
