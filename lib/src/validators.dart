String? requiredCallBack(String? value, {String? message}) {
  if (value == null || value == '') {
    return message ?? 'required';
  }
  return null;
}

String? maxLengthCallBack(
  String? value, {
  required int maxLength,
  required String? message,
}) {
  if (value != null && value.isNotEmpty && value.length > maxLength) {
    return message ?? 'length more than $maxLength';
  }
  return null;
}

String? regExpCallBack(
  String? value, {
  required String rawString,
  required String? message,
}) {
  final regExp = RegExp(rawString);
  if (value != null && value.isNotEmpty && !regExp.hasMatch(value)) {
    return message ?? 'RegExp has not match';
  }
  return null;
}
