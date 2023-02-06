import 'package:flutter/material.dart';

enum BasicContextPushTransitionType {
  basic,
  rightToLeft,
}

extension BasicContextExtensions on BuildContext {

  ThemeData get theme => Theme.of(this);

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  void popNavigator<T extends Object?>([T? result]) => Navigator.pop(this, result);

  void popUntilNavigator<T extends Object?>(RoutePredicate predicate) => Navigator.popUntil(this, predicate);
}
