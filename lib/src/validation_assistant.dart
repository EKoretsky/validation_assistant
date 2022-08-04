import 'package:validation_assistant/src/validators.dart';

typedef ValidationCallBack = String? Function(String? value);

/// This validation assistant. The class that encapsulates methods for validation.
class ValidationAssistant {
  final _validators = <ValidationCallBack>[];

  /// This method is allowing the class to be called as a function. You don't have to call it yourself.
  String? call(String? value) {
    for (final function in _validators) {
      final validationResult = function(value);
      if (validationResult != null) {
        return validationResult;
      }
    }
    return null;
  }

  /// This method checks if the field is required.
  ///
  /// Takes an optional parameter [message] with an arbitrary error message.
  /// ```
  /// Example:
  /// final validationAssistant = ValidationAssistant();
  /// ...
  /// TextFormField(
  ///   validator: validationAssistant
  ///     ..required('Custom message about error')
  /// )
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
  /// TextFormField(
  ///   validator: validationAssistant
  ///     ..maxLength(5, 'Custom message about error')
  /// )
  /// ```
  void maxLength(int maxLengthValue, [String? message]) {
    _validators.add((value) => maxLengthCallBack(
          value,
          maxLength: maxLengthValue,
          message: message,
        ));
  }

  /// This method checks the field for a regular expression match.
  ///
  /// Takes a required parameter [rawString] with regular expression as raw string,
  /// and an optional [message] parameter with a custom error message.
  /// ```
  /// Example:
  /// final validationAssistant = ValidationAssistant();
  /// ...
  /// TextFormField(
  ///   validator: validationAssistant
  ///     ..regExp(r'^\[[0-9]+:[0-9]+\]', 'Custom message about error')
  /// )
  /// ```
  void regExp(String rawString, [String? message]) {
    _validators.add((value) => regExpCallBack(
      value,
      rawString: rawString,
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
  /// TextFormField(
  ///   validator: validationAssistant
  ///     ..add(customValidationFunction)
  /// )
  /// ```
  void add(ValidationCallBack validationCallBack) {
    _validators.add((value) => validationCallBack(value));
  }
}
