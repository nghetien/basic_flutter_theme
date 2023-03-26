import 'package:basic_flutter_theme/src/src.dart';
import 'package:flutter/material.dart';

class BasicOutlineBorder{
  const BasicOutlineBorder._();

  static const BeveledRectangleBorder none = BeveledRectangleBorder(
    side: BorderSide(
      color: Colors.transparent,
      width: 0,
    ),
    borderRadius: BorderRadius.zero,
  );

  static final RoundedRectangleBorder left = RoundedRectangleBorder(
    side: const BorderSide(
      color: Colors.transparent,
      width: 0,
    ),
    borderRadius: BorderRadius.only(
      topLeft: BasicCorners.mainCornerRadius,
      bottomLeft: BasicCorners.mainCornerRadius,
    ),
  );

  static final RoundedRectangleBorder right = RoundedRectangleBorder(
    side: const BorderSide(
      color: Colors.transparent,
      width: 0,
    ),
    borderRadius: BorderRadius.only(
      topRight: BasicCorners.mainCornerRadius,
      bottomRight: BasicCorners.mainCornerRadius,
    ),
  );
}