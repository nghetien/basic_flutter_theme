import 'package:basic_flutter_theme/basic_flutter_theme.dart';
import 'package:flutter/material.dart';

class BasicFormValidator {
  const BasicFormValidator._();

  static FormFieldValidator<T> compose<T>(List<FormFieldValidator<T>> validators) {
    return (valueCandidate) {
      for (var validator in validators) {
        final validatorResult = validator.call(valueCandidate);
        if (validatorResult != null) return validatorResult;
      }
      return null;
    };
  }

  static FormFieldValidator<String> email({String? errorText}) => (valueCandidate) =>
  (valueCandidate?.isNotEmpty ?? false) && !BasicEmailValidator.isEmail(valueCandidate!)
      ? errorText ?? BasicFormValidatorMessageError().email
      : null;

  static FormFieldValidator<T> required<T>({String? errorText}) {
    return (T? valueCandidate) {
      if (valueCandidate == null ||
          (valueCandidate is String && valueCandidate.trim().isEmpty) ||
          (valueCandidate is Iterable && valueCandidate.isEmpty) ||
          (valueCandidate is Map && valueCandidate.isEmpty)) {
        return errorText ?? BasicFormValidatorMessageError().required;
      }
      return null;
    };
  }

  static FormFieldValidator<T> equal<T>(
    Object value, {
    String? errorText,
    bool isNumber = true,
  }) =>
      (valueCandidate) => isNumber
          ? (value != BasicNumberTransformer.currencyToNumber(valueCandidate.toString())
              ? errorText ?? BasicFormValidatorMessageError().equal!(value)
              : null)
          : (valueCandidate != value
              ? errorText ?? BasicFormValidatorMessageError().equal!(value)
              : null);

  static FormFieldValidator<T> notEqual<T>(
    Object value, {
    String? errorText,
    bool isNumber = true,
  }) =>
      (valueCandidate) => isNumber
          ? (value == BasicNumberTransformer.currencyToNumber(valueCandidate.toString())
              ? errorText ?? BasicFormValidatorMessageError().notEqual!(value)
              : null)
          : (valueCandidate == value
              ? errorText ?? BasicFormValidatorMessageError().notEqual!(value)
              : null);

  static FormFieldValidator<T> min<T>(
    num min, {
    bool inclusive = true,
    String? errorText,
  }) {
    return (T? valueCandidate) {
      if (valueCandidate != null) {
        assert(valueCandidate is num || valueCandidate is String);
        final number = BasicNumberTransformer.currencyToNumber(valueCandidate.toString());
        if (number != null && (inclusive ? number < min : number <= min)) {
          return errorText ?? BasicFormValidatorMessageError().min!('$min');
        }
      }
      return null;
    };
  }

  static FormFieldValidator<T> max<T>(num max, {
    bool inclusive = true,
    String? errorText,
  }) {
    return (T? valueCandidate) {
      if (valueCandidate != null) {
        assert(valueCandidate is num || valueCandidate is String);
        final number = BasicNumberTransformer.currencyToNumber(valueCandidate.toString());
        if (number != null && (inclusive ? number > max : number >= max)) {
          return errorText ?? BasicFormValidatorMessageError().max!('$max');
        }
      }
      return null;
    };
  }

  static FormFieldValidator<T> minLength<T>(int minLength, {
    bool allowEmpty = false,
    String? errorText,
  }) {
    assert(minLength > 0);
    return (T? valueCandidate) {
      assert(valueCandidate is String || valueCandidate is Iterable || valueCandidate == null);
      var valueLength = 0;
      if (valueCandidate is String) valueLength = valueCandidate.length;
      if (valueCandidate is Iterable) valueLength = valueCandidate.length;
      return valueLength < minLength && (!allowEmpty || valueLength > 0)
          ? errorText ?? BasicFormValidatorMessageError().minLength!(minLength)
          : null;
    };
  }

  static FormFieldValidator<T> maxLength<T>(int maxLength, {String? errorText}) {
    assert(maxLength > 0);
    return (T? valueCandidate) {
      assert(valueCandidate is String || valueCandidate is Iterable || valueCandidate == null);
      int valueLength = 0;
      if (valueCandidate is String) valueLength = valueCandidate.length;
      if (valueCandidate is Iterable) valueLength = valueCandidate.length;
      return null != valueCandidate && valueLength > maxLength
          ? errorText ?? BasicFormValidatorMessageError().maxLength!(maxLength)
          : null;
    };
  }

  static FormFieldValidator<T> equalLength<T>(int length, {
    bool allowEmpty = false,
    String? errorText,
  }) {
    assert(length > 0);
    return (T? valueCandidate) {
      assert(valueCandidate is String ||
          valueCandidate is Iterable ||
          valueCandidate is int ||
          valueCandidate == null);
      int valueLength = 0;

      if (valueCandidate is int) valueLength = valueCandidate.toString().length;
      if (valueCandidate is String) valueLength = valueCandidate.length;
      if (valueCandidate is Iterable) valueLength = valueCandidate.length;

      return valueLength != length && (!allowEmpty || valueLength > 0)
          ? errorText ?? BasicFormValidatorMessageError().equalLength!(length)
          : null;
    };
  }

  static FormFieldValidator<String> url({
    String? errorText,
    List<String> protocols = const ['http', 'https', 'ftp'],
    bool requireTld = true,
    bool requireProtocol = false,
    bool allowUnderscore = false,
    List<String> hostWhitelist = const [],
    List<String> hostBlacklist = const [],
  }) =>
          (valueCandidate) => true == valueCandidate?.isNotEmpty &&
          !BasicUrlValidator.isURL(valueCandidate,
              protocols: protocols,
              requireTld: requireTld,
              requireProtocol: requireProtocol,
              allowUnderscore: allowUnderscore,
              hostWhitelist: hostWhitelist,
              hostBlacklist: hostBlacklist)
          ? errorText ?? BasicFormValidatorMessageError().url
          : null;

  static FormFieldValidator<String> match(String pattern, {String? errorText}) =>
          (valueCandidate) =>
      true == valueCandidate?.isNotEmpty && !RegExp(pattern).hasMatch(valueCandidate!)
          ? errorText ?? BasicFormValidatorMessageError().match!(pattern)
          : null;

  static FormFieldValidator<String> numeric({String? errorText}) => (valueCandidate) =>
  true == valueCandidate?.isNotEmpty && null == num.tryParse(valueCandidate!)
      ? errorText ?? BasicFormValidatorMessageError().numeric
      : null;

  static FormFieldValidator<String> integer({String? errorText, int? radix}) => (valueCandidate) =>
  true == valueCandidate?.isNotEmpty && null == int.tryParse(valueCandidate!, radix: radix)
      ? errorText ?? BasicFormValidatorMessageError().integer
      : null;

  static FormFieldValidator<String> creditCard({
    String? errorText,
  }) =>
          (valueCandidate) => true == valueCandidate?.isNotEmpty &&
          !BasicCreditCardValidator.isCreditCard(valueCandidate!)
          ? errorText ?? BasicFormValidatorMessageError().creditCard
          : null;

  static FormFieldValidator<String> ip({int? version, String? errorText}) => (valueCandidate) =>
  true == valueCandidate?.isNotEmpty && !BasicIPValidator.isIP(valueCandidate!, version)
      ? errorText ?? BasicFormValidatorMessageError().ip
      : null;

  static FormFieldValidator<String> dateTime({String? errorText, String? validator}) =>
          (valueCandidate) => true == valueCandidate?.isNotEmpty &&
          !BasicDateTimeValidator.isDateTime(
            valueCandidate!,
            validator: validator,
          )
          ? errorText ?? BasicFormValidatorMessageError().dateTime
          : null;

  static FormFieldValidator<String> timeOfDay({String? errorText}) =>
          (valueCandidate) => true == valueCandidate?.isNotEmpty &&
          !BasicDateTimeValidator.isTimeOfDay(
            valueCandidate!,
          )
          ? errorText ?? BasicFormValidatorMessageError().timeOfDay
          : null;

  static FormFieldValidator<String> phone({String? errorText}) => (valueCandidate) =>
  true == valueCandidate?.isNotEmpty && !BasicPhoneValidator.isPhone(valueCandidate!)
      ? errorText ?? BasicFormValidatorMessageError().phone
      : null;
}
