import 'package:basic_flutter_theme/basic_flutter_theme.dart';
import 'package:flutter/material.dart';

typedef BasicBottomSheetBuilder = Widget Function(
  BuildContext context,
  ScrollController controller,
);

class BasicBottomSheet {
  const BasicBottomSheet._();

  static Future<T?> buttonSheetScrollable<T>(
    BuildContext btnContext, {
    required BasicBottomSheetBuilder builder,
    double? initialChildSize,
    double? minChildSize,
    double? maxChildSize,
    Radius? radius,
    Color? backgroundColor,
  }) =>
      showModalBottomSheet<T>(
        context: btnContext,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: backgroundColor ?? Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: radius ?? BasicCorners.cornerRadius5,
          ),
        ),
        builder: (context) => DraggableScrollableSheet(
          initialChildSize: initialChildSize ?? 0.45,
          minChildSize: minChildSize ?? 0.2,
          maxChildSize: maxChildSize ?? 1,
          builder: builder,
        ),
      );

  static Future<T?> buttonSheet<T>(
    BuildContext btnContext, {
    required Widget Function(BuildContext) builder,
    Radius? radius,
    Color? backgroundColor,
  }) =>
      showModalBottomSheet<T>(
        context: btnContext,
        backgroundColor: backgroundColor ?? Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: radius ?? BasicCorners.cornerRadius5,
          ),
        ),
        builder: builder,
      );
}
