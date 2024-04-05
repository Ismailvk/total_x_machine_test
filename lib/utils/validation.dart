class Validations {
  static String? isNumber(String? value) {
    final hasNumber = RegExp(r'^\d+$');
    if (value == null || value.isEmpty || value.length < 10)
      return 'Entere valid phone number';
    return hasNumber.hasMatch(value) ? null : 'only Number is allowed';
  }
}
