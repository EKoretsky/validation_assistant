import 'package:test/test.dart';
import 'package:validation_assistant/src/validation_assistant.dart';

void main() {
  group('Test group for minLength', () {
    late ValidationAssistant validationAssistant;
    setUp(() => validationAssistant = ValidationAssistant());

    test('value length less than minLength without users message', () {
      validationAssistant.minLength(3);
      expect(validationAssistant('te'), 'length less than 3');
    });

    test('value length equal minLength without users message', () {
      validationAssistant.minLength(3);
      expect(validationAssistant('tes'), isNull);
    });

    test('value length more than minLength without users message', () {
      validationAssistant.minLength(3);
      expect(validationAssistant('test'), isNull);
    });

    test('value length less than minLength with users message', () {
      validationAssistant.minLength(3, 'users error message');
      expect(validationAssistant('te'), 'users error message');
    });

    test('value length equal minLength with users message', () {
      validationAssistant.minLength(3, 'users error message');
      expect(validationAssistant('tes'), isNull);
    });

    test('value length more than minLength without users message', () {
      validationAssistant.minLength(3, 'users error message');
      expect(validationAssistant('test'), isNull);
    });
  });
}
