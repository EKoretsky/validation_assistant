import 'package:test/test.dart';

import 'package:validation_assistant/validation_assistant.dart';

void main() {
    final validationAssistant = ValidationAssistant();

    group('Test group for required ', () {
      test('value is null', () {
        validationAssistant.required();
        expect(validationAssistant(null), 'required');
      });

      test('value equal empty string', () {
        validationAssistant.required();
        expect(validationAssistant(''), 'required');
      });

      test('value is not null and is not empty string', () {
        validationAssistant.required();
        expect(validationAssistant('value'), isNull);
      });
    });
}
