import 'package:flutter/material.dart';
import 'package:practice_1/data/user_provider.dart';
import 'package:practice_1/models/user.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({
    super.key,
    /* required this.userData */
  });
  // final User userData;

  @override
  Widget build(BuildContext context) {
    User userData = User(
      name: UserProvider.of(context).userData.name,
      age: UserProvider.of(context).userData.age,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Page'),
      ),
      body: Center(
        child: TextButton(
          child: Text('hola ${userData.name} ustedes en promedio tienen ${userData.age} '),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
