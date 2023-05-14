import 'package:collection/collection.dart';

class BasicIsEqual {
  const BasicIsEqual._();

  static bool isEqual(dynamic a, dynamic b) {
    if (a == null && b == null) {
      return true;
    }
    if (a == null || b == null) {
      return false;
    }

    if (a is List && b is List) {
      return const DeepCollectionEquality.unordered().equals(a, b);
    }
    if (a is DateTime && b is DateTime) {
      return a.isAtSameMomentAs(b);
    }
    return a == b;
  }
}
