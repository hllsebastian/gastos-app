import 'package:flutter/material.dart';
import 'package:practice_1/config/app_routes.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page'),
      ),
      body: Center(
          child: TextButton(
        child: const Text('Oeoeoee!! todo anda bien'),
        onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.otherPage),
        // onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OtherPage())),
      )),
    );
  }
}
