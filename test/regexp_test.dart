import 'package:test/test.dart';
import 'package:validation_assistant/validation_assistant.dart';

void main() {
  group('Tests group for regexp method', () {
    test('Valid value for regexp without user message', () {
      final validationAssistant = ValidationAssistant();
      validationAssistant.regExp(r'^\d+$');

      expect(validationAssistant('12312412'), isNull);
    });

    test('Invalid value for regexp without user message', () {
      final validationAssistant = ValidationAssistant();
      validationAssistant.regExp(r'^\d+$');

      expect(validationAssistant('12312412dfdf'), 'RegExp has not match');
    });

    test('Invalid value for regexp with user message', () {
      final validationAssistant = ValidationAssistant();
      validationAssistant.regExp(r'^\d+$', 'users error message');

      expect(validationAssistant('12312412dfdf'), 'users error message');
    });

    test('Value equal empty string', () {
      final validationAssistant = ValidationAssistant();
      validationAssistant.regExp(r'^\d+$');

      expect(validationAssistant(''), isNull);
    });
  });
}
