class BasicPhoneValidator {
  const BasicPhoneValidator._();

  static bool isPhone(String str) => RegExp(r'^\+?\d{10,13}$').hasMatch(str);
}
