import 'package:practice_1/design/gastos_texts.dart';

String? validateInput(String? value, [bool isPassword = false]) {
  if (value == null || value.isEmpty) {
    return GastosTexts.emptyFieldError;
  }
  if (value.length >= 10 && !isPassword) {
    return GastosTexts.lengthFieldError;
  }
  return null;
}
