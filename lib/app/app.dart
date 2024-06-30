import 'package:curso_weincode/config/routes/app_routes.dart';
import 'package:curso_weincode/home/domain/user_model.dart';
import 'package:curso_weincode/home/home_screen.dart';
import 'package:curso_weincode/home/login_screen.dart';
import 'package:curso_weincode/home/new_screen.dart';
import 'package:curso_weincode/home/other_screen.dart';
import 'package:curso_weincode/home/providers/inherted_widget/theme_inherted.dart';
import 'package:curso_weincode/shared/theme/theme_app.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isDark = false;
  bool isDark2 = false;
  @override
  Widget build(BuildContext context) {
    return ThemeInherted(
      changedTheme: (bool value) {
        setState(() {
          isDark2 = value;
        });
      },
      isDark: isDark2,
      child: MaterialApp(
        title: 'App',
        theme: isDark2 ? ThemeData.light() : ThemeApp.themeDark,
        // routes: {
        //   AppRoutes.home: (context) => const HomeScreen(),
        //   AppRoutes.newScreen: (context) => const NewScreen(),
        //   AppRoutes.otherScreen: (context) => const OtherScreen(),
        // },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case AppRoutes.home:
              return MaterialPageRoute(
                builder: (context) => HomeScreen(
                  nameStore: settings.arguments as String,
                  changedTheme: (bool value) {
                    setState(() {
                      isDark = !isDark;
                    });
                  },
                  isDarkTheme: isDark,
                ),
              );
            case AppRoutes.newScreen:
              return MaterialPageRoute(builder: (context) => const NewScreen());
            case AppRoutes.otherScreen:
              return MaterialPageRoute(
                builder: (context) => OtherScreen(
                  user: settings.arguments as UserModel,
                ),
              );
            case AppRoutes.loginSacreen:
              return MaterialPageRoute(
                  builder: (context) => const LoginScreen());
            default:
              return MaterialPageRoute(
                  builder: (context) => const LoginScreen());
          }
        },
      ),
    );
  }
}
