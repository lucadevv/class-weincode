import 'package:curso_weincode/config/routes/app_routes.dart';
import 'package:curso_weincode/shared/intl/copy_app.dart';
import 'package:curso_weincode/shared/theme/app_colors.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginFormKey = GlobalKey<FormState>();
  final userName = TextEditingController();

  bool isObscureText = true;
  bool isCheckBox = false;

  changeObsucreText() {
    setState(() {
      isObscureText = !isObscureText;
    });
  }

  changedCheckBox() {
    setState(() {
      isCheckBox = !isCheckBox;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                CopyApp.hello,
                style: textTheme.displayLarge!.copyWith(
                  color: AppColors.brandPrimaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 21, 16, 59),
                child: Text(
                  CopyApp.lorem,
                  style: textTheme.labelMedium!.copyWith(
                    color: AppColors.brandLigthDarkColor,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: loginFormKey,
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.brandSecondaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextFormField(
                        style: textTheme.displaySmall,
                        controller: userName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '${CopyApp.userInputLaber} is Empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 25),
                          label: const Text(
                            CopyApp.userInputLaber,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: AppColors.brandPrimaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.brandSecondaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '${CopyApp.userPasswordInoutLabel} is Empty';
                          }
                          return null;
                        },
                        obscureText: isObscureText,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 25),
                          suffixIcon: IconButton(
                            onPressed: changeObsucreText,
                            icon: Icon(isObscureText
                                ? Icons.visibility_off
                                : Icons.remove_red_eye),
                          ),
                          label: const Text(
                            CopyApp.userPasswordInoutLabel,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: AppColors.brandPrimaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: isCheckBox,
                          onChanged: (value) {
                            changedCheckBox();
                          },
                        ),
                        const Text(CopyApp.rememberMer),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(CopyApp.recoveryPassword),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        elevation: 20,
                        height: 70,
                        color: AppColors.brandPrimaryColor,
                        onPressed: () {
                          if (loginFormKey.currentState!.validate()) {
                            Navigator.of(context).pushReplacementNamed(
                              AppRoutes.home,
                              arguments: userName.text.toUpperCase().trim(),
                            );
                          }
                        },
                        child: Text(
                          CopyApp.loginIn,
                          style: textTheme.displayMedium!.copyWith(
                            color: AppColors.brandSecondaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: 200,
                              height: 2,
                              color: AppColors.brandSecondaryColor,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Text(CopyApp.orContinue),
                          ),
                          Expanded(
                            child: Container(
                              width: 200,
                              height: 2,
                              color: AppColors.brandSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
