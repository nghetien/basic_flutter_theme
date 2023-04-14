class BasicNumberTransformer {
  const BasicNumberTransformer._();

  static num? currencyToNumber(String? value) {
    if (value == null || value.isEmpty) return null;
    return num.parse(value.replaceAll(',', '').trim());
  }
}
