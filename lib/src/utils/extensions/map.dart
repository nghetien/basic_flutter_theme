extension BasicMapStringToDynamicExtension on Map<String, dynamic> {
  Map<String, dynamic> get clearNullValue => this..removeWhere((key, value) => value == null);
}
