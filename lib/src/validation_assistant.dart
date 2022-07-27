import 'package:validation_assistant/src/validators.dart';

typedef ValidationCallBack = String? Function(String? value);

class ValidationAssistant {
  final _validators = <ValidationCallBack>[];

  String? call(String? value) {
    final function = _validators.firstWhere((func) => func(value) != null, orElse: () => (value) => null);
    return function(value);
  }

  void required([String? message]) {
    _validators.add((value) => requiredCallBack(value, message: message));
  }

  void maxLength(int maxLengthValue, [String? message]) {
    _validators.add((value) => maxLengthCallBack(value, maxLength: maxLengthValue, message: message));
  }

  void add(ValidationCallBack validationCallBack) {
    _validators.add((value) => validationCallBack(value));
  }
}
