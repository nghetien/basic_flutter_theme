import 'package:flutter/material.dart';

enum BasicContextPushTransitionType {
  basic,
  rightToLeft,
}

extension BasicContextExtensions on BuildContext {

  ThemeData get theme => Theme.of(this);

  double get widthScreen => MediaQuery.of(this).size.width;

  double get heightScreen => MediaQuery.of(this).size.height;

  void popNavigator<T extends Object?>([T? result]) =>
      Navigator.of(this, rootNavigator: true).pop(result);

  void popUntilNavigator<T extends Object?>(RoutePredicate predicate) => Navigator.popUntil(this, predicate);
}
