import 'package:test/test.dart';
import 'package:validation_assistant/validation_assistant.dart';

void main() {
  group('Test group for required ', () {
    test('value is null without users message', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.required();
      expect(validationAssistant(null), 'required');
    });

    test('value is null with users message', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.required('users error message');
      expect(validationAssistant(null), 'users error message');
    });

    test('value equal empty string without users message', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.required();
      expect(validationAssistant(''), 'required');
    });

    test('value equal empty string with users message', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.required('users error message');
      expect(validationAssistant(''), 'users error message');
    });

    test('value is not null and is not empty string without users message', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.required();
      expect(validationAssistant('value'), isNull);
    });

    test('value is not null and is not empty string with users message', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.required('users error message');
      expect(validationAssistant('value'), isNull);
    });
  });
}
