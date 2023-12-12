import 'package:flutter/material.dart';
import 'package:practice_1/data/user_provider.dart';
import 'package:practice_1/design/gastos_texts.dart';
import 'package:practice_1/models/user.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    User userData = User(
      name: UserProvider.of(context).userData.name,
      age: UserProvider.of(context).userData.age,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(GastosTexts.otherPage),
      ),
      body: Center(
        child: TextButton(
          child: Text('hola ${userData.name} en promedio tienes ${userData.age} '),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
