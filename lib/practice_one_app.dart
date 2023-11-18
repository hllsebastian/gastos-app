import 'package:flutter/material.dart';
import 'package:practice_1/design/themes.dart';
import 'package:practice_1/pages/home_page.dart';

class PracticeOneApp extends StatelessWidget {
  const PracticeOneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: PracticeOneThemes.defaulTheme,
      home: const HomePage(),
    );
  }
}
