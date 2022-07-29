import 'package:validation_assistant/src/validators.dart';

typedef ValidationCallBack = String? Function(String? value);

/// This validation assistant. The class that encapsulates methods for validation.
class ValidationAssistant {
  final _validators = <ValidationCallBack>[];

  /// This method is allowing the class to be called as a function. You don't have to call it yourself.
  String? call(String? value) {
    final function = _validators.firstWhere(
      (func) => func(value) != null,
      orElse: () => (value) => null,
    );
    return function(value);
  }

  /// This method checks if the field is required.
  ///
  /// Takes an optional parameter [message] with an arbitrary error message.
  /// ```
  /// Example:
  /// final validationAssistant = ValidationAssistant();
  /// ...
  /// validation
  ///   ...required('Custom message about error')
  /// ```
  void required([String? message]) {
    _validators.add((value) => requiredCallBack(value, message: message));
  }

  /// This method checks the field for exceeding the allowed number of characters.
  ///
  /// Takes a required parameter [maxLengthValue] with the maximum number of characters allowed,
  /// and an optional [message] parameter with a custom error message.
  /// ```
  /// Example:
  /// final validationAssistant = ValidationAssistant();
  /// ...
  /// validation
  ///   ...maxLength(5, 'Custom message about error')
  /// ```
  void maxLength(int maxLengthValue, [String? message]) {
    _validators.add((value) => maxLengthCallBack(
          value,
          maxLength: maxLengthValue,
          message: message,
        ));
  }

  /// This method accepts an arbitrary validating function.
  ///
  /// ```
  /// Example:
  /// final validationAssistant = ValidationAssistant();
  /// ...
  /// String? customValidationFunction(String? value) {
  ///   if (value < 5) {
  ///     return 'error message';
  ///   }
  ///   return null;
  /// }
  /// ...
  /// validation
  ///   ...add(customValidationFunction)
  /// ``
  void add(ValidationCallBack validationCallBack) {
    _validators.add((value) => validationCallBack(value));
  }
}
