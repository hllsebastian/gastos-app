import 'package:flutter/material.dart';
import 'package:practice_1/design/colors.dart';
import 'package:practice_1/widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 97,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        backgroundColor: PracticeOneColors.brandLightColor,
        title: const AppBarItems(),
      ),
      body: const Center(
          child: Text('Welcome 🚀!!!',
              style: TextStyle(
                fontSize: 34,
              ))),
    );
  }
}
