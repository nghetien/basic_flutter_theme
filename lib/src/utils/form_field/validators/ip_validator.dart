class BasicIPValidator {
  const BasicIPValidator._();

  static final RegExp ipv4Maybe = RegExp(r'^(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)$');

  static final RegExp ipv6 = RegExp(r'^::|^::1|^([a-fA-F\d]{1,4}::?){1,7}([a-fA-F\d]{1,4})$');

  static bool isIP(String? str, int? version) {
    if (version == null) {
      return isIP(str, 4) || isIP(str, 6);
    } else if (version == 4) {
      if (!ipv4Maybe.hasMatch(str!)) {
        return false;
      }
      var parts = str.split('.');
      parts.sort((a, b) => int.parse(a) - int.parse(b));
      return int.parse(parts[3]) <= 255;
    }
    return version == 6 && ipv6.hasMatch(str!);
  }
}
