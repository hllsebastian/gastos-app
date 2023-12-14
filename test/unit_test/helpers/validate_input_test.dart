import 'package:flutter_test/flutter_test.dart';
import 'package:practice_1/design/gastos_texts.dart';
import 'package:practice_1/pages/helpers/validate_input.dart';

// Testing by group and functionality
void main() {
  group('testing Validate Input', () {
    test('invalid user', () {
      // Arrenge -> To prepare for run test
      const inputValue = 'moreOfElevenCharacthers';
      final expectedError = GastosTexts.lengthFieldError;

      // Act -> To run the action to test
      final currentValue = validateInput(inputValue);

      // Assert -> To look if  the action works
      expect(currentValue, expectedError);
    });
    test('invalid user null', () {
      // Arrenge -> To prepare for run test
      String? inputValue;
      final expectedError = GastosTexts.emptyFieldError;

      // Act -> To run the action to test
      final currentValue = validateInput(inputValue);

      // Assert -> To look if  the action works
      expect(currentValue, expectedError);
    });
    test('valid user', () {
      // Arrenge -> To prepare for run test
      String? inputValue = 'asdf';
      String? expectedError;

      // Act -> To run the action to test
      final currentValue = validateInput(inputValue);

      // Assert -> To look if  the action works
      expect(currentValue, expectedError);
    });
  });
}
