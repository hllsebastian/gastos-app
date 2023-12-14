// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practice_1/data/user_provider.dart';
import 'package:practice_1/design/gastos_texts.dart';
import 'package:practice_1/models/user.dart';
import 'package:practice_1/pages/login_page.dart';

// To run the app (1)
final fakeApp = UserProvider(
  userData: User(name: '', age: 0),
  child: MaterialApp(
    home: const LogInPage(),
    routes: {'home': (context) => const Scaffold()},
  ),
);

void main() {
  group('Find all the widgets on the screen', () {
    testWidgets('find the title', (widgetTester) async {
      // Arrenge
      await widgetTester.pumpWidget(fakeApp); // To run the app (1)
      final title = GastosTexts.welcome;

      // Act
      final findedTittle = find.text(title);

      // Assert
      expect(findedTittle, findsOneWidget);
    });
    testWidgets('find by key input name', (widgetTester) async {
      // Arrenge
      await widgetTester.pumpWidget(fakeApp); // To run the app (1)
      const inputNameKey = Key('input-name');

      // Act
      final findedInputName = find.byKey(inputNameKey);

      // Assert
      expect(findedInputName, findsOneWidget);
    });
    testWidgets('find the button by type', (widgetTester) async {
      // Arrenge
      await widgetTester.pumpWidget(fakeApp); // To run the app (1)

      // Act
      final findedInputPsw = find.byType(ElevatedButton);

      // Assert
      expect(findedInputPsw, findsOneWidget);
    });
  });
  group('available to interact with the widgets', () {
    testWidgets('fill user name', (widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(fakeApp); // To run the app (1)
      const inputNameKey = Key('input-name');
      final findedInputName = find.byKey(inputNameKey);
      const userName = 'Aloha';

      // Act
      await widgetTester.enterText(findedInputName, userName);
      await widgetTester.pump();

      // Assert
      final findedUserName = find.text(userName);
      expect(findedUserName, findsOneWidget);
    });
  });
  group('Test differents interaction scenarios ', () {
    testWidgets('fill user name wrong but the pasw fine', (widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(fakeApp); // To run the app (1)
      final expectedError = GastosTexts.emptyFieldError;
      const userName = 'Aloha';
      const inputNameKey = Key('input-name');
      final findedInputName = find.byKey(inputNameKey);
      final findedBtn = find.byType(ElevatedButton);

      // Act
      await widgetTester.enterText(findedInputName, userName);
      await widgetTester.pump();
      await widgetTester.tap(findedBtn);
      await widgetTester.pump();

      // Assert
      final findedError = find.text(expectedError);
      expect(findedError, findsOneWidget);
    });
    testWidgets('fill user name wrong but the pasw fin', (widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(fakeApp); // To run the app (1)
      final expectedError = GastosTexts.lengthFieldError;
      const userName = 'Alooooooooha';
      const inputNameKey = Key('input-name');
      const inputPswKey = Key('input-psw');
      final findedInputName = find.byKey(inputNameKey);
      final findedInputPsw = find.byKey(inputPswKey);
      final findedBtn = find.byType(ElevatedButton);
      String userPsw = 'abcd';

      // Act
      await widgetTester.enterText(findedInputName, userName);
      await widgetTester.pump();
      await widgetTester.enterText(findedInputPsw, userPsw);
      await widgetTester.pump();
      await widgetTester.tap(findedBtn);
      await widgetTester.pump();

      // Assert
      final findedError = find.text(expectedError);
      expect(findedError, findsOneWidget);
    });
    testWidgets('fill all fields wrong', (widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(fakeApp); // To run the app (1)
      final expectedNameError = GastosTexts.lengthFieldError;
      final expectedPswError = GastosTexts.emptyFieldError;
      const userName = 'Alooooooooha';
      const inputNameKey = Key('input-name');
      const inputPswKey = Key('input-psw');
      final findedInputName = find.byKey(inputNameKey);
      final findedInputPsw = find.byKey(inputPswKey);
      final findedBtn = find.byType(ElevatedButton);
      String userPsw = '';

      // Act
      await widgetTester.enterText(findedInputName, userName);
      await widgetTester.pump();
      await widgetTester.enterText(findedInputPsw, userPsw);
      await widgetTester.pump();
      await widgetTester.tap(findedBtn);
      await widgetTester.pump();

      // Assert
      final findedNameError = find.text(expectedNameError);
      final findedPswError = find.text(expectedPswError);
      expect(findedNameError, findsOneWidget);
      expect(findedPswError, findsOneWidget);
    });
    testWidgets('fill all fields ok', (widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(fakeApp); // To run the app (1)
      const userName = 'Aloha';
      const userPsw = 'abcd';
      const inputNameKey = Key('input-name');
      const inputPswKey = Key('input-psw');
      final findedInputName = find.byKey(inputNameKey);
      final findedInputPsw = find.byKey(inputPswKey);
      final findedBtn = find.byType(ElevatedButton);

      // Act
      await widgetTester.enterText(findedInputName, userName);
      await widgetTester.pump();
      await widgetTester.enterText(findedInputPsw, userPsw);
      await widgetTester.pump();
      await widgetTester.tap(findedBtn);
      await widgetTester.pump();

      // Assert
      expect(find.text(GastosTexts.emptyFieldError), findsNothing);
      expect(find.text(GastosTexts.lengthFieldError), findsNothing);
    });
  });

  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
