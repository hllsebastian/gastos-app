import 'package:flutter/material.dart';
import 'package:practice_1/models/user.dart';

class UserProvider extends InheritedWidget {
  const UserProvider({super.key, required super.child, required this.userData});
  // Data to share
  final User userData;

  // To catch info just using the context
  static UserProvider of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<UserProvider>()!;
  }

  @override
  bool updateShouldNotify(UserProvider oldWidget) {
    return oldWidget.userData.name != userData.name || oldWidget.userData.age != userData.age ? true : false;
  }
}
