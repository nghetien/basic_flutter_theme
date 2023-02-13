RegExp _creditCard = RegExp(
  r'^(?:4\d{12}(?:\d{3})?|5[1-5]\d{14}|6(?:011|5\d\d)\d{12}|3[47]\d{13}|3(?:0[0-5]|[68]\d)\d{11}|(?:2131|1800|35\d{3})\d{11})$',
);

class BasicCreditCardValidator {
  const BasicCreditCardValidator._();

  static bool isCreditCard(String str) {
    var sanitized = str.replaceAll(RegExp(r'\D+'), '');
    if (!_creditCard.hasMatch(sanitized)) {
      return false;
    }

    var sum = 0;
    String digit;
    var shouldDouble = false;

    for (var i = sanitized.length - 1; i >= 0; i--) {
      digit = sanitized.substring(i, (i + 1));
      var tmpNum = int.parse(digit);

      if (shouldDouble == true) {
        tmpNum *= 2;
        if (tmpNum >= 10) {
          sum += ((tmpNum % 10) + 1);
        } else {
          sum += tmpNum;
        }
      } else {
        sum += tmpNum;
      }
      shouldDouble = !shouldDouble;
    }

    return (sum % 10 == 0);
  }
}
