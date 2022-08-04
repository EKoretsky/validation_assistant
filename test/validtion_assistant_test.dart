import 'package:test/test.dart';

import 'package:validation_assistant/validation_assistant.dart';

void main() {
  group('Test group for required ', () {
    test('value is null', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.required();
      expect(validationAssistant(null), 'required');
    });

    test('value equal empty string', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.required();
      expect(validationAssistant(''), 'required');
    });

    test('value is not null and is not empty string', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.required();
      expect(validationAssistant('value'), isNull);
    });
  });

  group('Test group for maxLength', () {
    test('value length less than maxLength', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.maxLength(5);
      expect(validationAssistant('test'), isNull);
    });

    test('value length less than maxLength with custom message', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.maxLength(5, 'custom error message');
      expect(validationAssistant('test'), isNull);
    });

    test('value length equal maxLength', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.maxLength(5);
      expect(validationAssistant('test5'), isNull);
    });

    test('value length equal maxLength with custom message', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.maxLength(5, 'custom error message');
      expect(validationAssistant('test5'), isNull);
    });

    test('value length more than maxLength', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.maxLength(5);
      expect(validationAssistant.call('length more than 5'), 'length more than 5');
    });

    test('value length more than maxLength with custom error message', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.maxLength(5, 'custom error message');
      expect(validationAssistant('value more than five'), 'custom error message');
    });
  });
}
