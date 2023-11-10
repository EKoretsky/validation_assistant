String? requiredCallBack(String? value, {required String message}) {
  return switch (value) {
    null || '' => message,
    _ => null,
  };
}

String? maxLengthCallBack(
  String? value, {
  required int maxLength,
  required String message,
}) {
  if (value != null && value.isNotEmpty && value.length > maxLength) {
    return message;
  }
  return null;
}

String? minLengthCallBack(
  String? value, {
  required int minLength,
  required String message,
}) {
  if (value != null && value.isNotEmpty && value.length < minLength) {
    return message;
  }
  return null;
}

String? regExpCallBack(
  String? value, {
  required String rawString,
  required String message,
}) {
  final regExp = RegExp(rawString);
  if (value != null && value.isNotEmpty && !regExp.hasMatch(value)) {
    return message;
  }
  return null;
}
