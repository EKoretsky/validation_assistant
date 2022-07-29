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
  if (value != null && value.length > maxLength) {
    print(value);
    return message ?? 'length more than $maxLength';
  }
  return null;
}
