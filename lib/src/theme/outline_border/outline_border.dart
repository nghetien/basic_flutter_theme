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
}