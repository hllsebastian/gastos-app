import 'package:flutter/material.dart';
import 'package:practice_1/config/app_routes.dart';
import 'package:practice_1/design/themes.dart';
import 'package:practice_1/models/user.dart';
import 'package:practice_1/pages/home_page.dart';
import 'package:practice_1/pages/new_page.dart';
import 'package:practice_1/pages/other_page.dart';

class PracticeOneApp extends StatelessWidget {
  const PracticeOneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: PracticeOneThemes.defaulTheme,
      home: const HomePage(),
      // routes: {
      //   AppRoutes.detailsPage: (context) => const HomePage(),
      //   AppRoutes.newpage: (context) => const NewPage(),
      //   AppRoutes.otherPage: (context) => const OtherPage(
      //         userData: User(name: '', age: 0),
      //       ),

      // },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case (AppRoutes.newpage):
            return MaterialPageRoute(builder: (context) => const NewPage());
          case (AppRoutes.otherPage):
            return MaterialPageRoute(builder: (context) => OtherPage(userData: settings.arguments as User));
          default:
            return MaterialPageRoute(builder: (context) => const HomePage());
        }
      },
    );
  }
}
