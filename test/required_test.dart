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
}
