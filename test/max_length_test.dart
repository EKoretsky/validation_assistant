import 'package:test/test.dart';
import 'package:validation_assistant/validation_assistant.dart';

void main() {
  group('Test group for maxLength', () {
    test('value length less than maxLength without users message', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.maxLength(5);
      expect(validationAssistant('test'), isNull);
    });

    test('value length less than maxLength with users message', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.maxLength(5, 'users error message');
      expect(validationAssistant('test'), isNull);
    });

    test('value length equal maxLength without users message', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.maxLength(5);
      expect(validationAssistant('test5'), isNull);
    });

    test('value length equal maxLength with users message', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.maxLength(5, 'users error message');
      expect(validationAssistant('test5'), isNull);
    });

    test('value length more than maxLength without users message', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.maxLength(5);
      expect(validationAssistant('length more than 5'), 'length more than 5');
    });

    test('value length more than maxLength with users error message', () {
      final validationAssistant = ValidationAssistant();

      validationAssistant.maxLength(5, 'users error message');
      expect(
          validationAssistant('value more than five'), 'users error message');
    });
  });
}
