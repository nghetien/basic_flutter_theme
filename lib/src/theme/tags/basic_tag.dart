import 'package:basic_flutter_theme/src/styles/styles.dart';
import 'package:flutter/material.dart';

class BasicTags {
  const BasicTags._();

  static Widget success(String value) => Container(
        decoration: const BoxDecoration(
          color: BasicAppColors.green,
          borderRadius: BasicCorners.cornerBorder5,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: BasicPaddings().p8,
          vertical: BasicPaddings().p4,
        ),
        child: Text(
          value,
          style: BasicTextStyles.body.copyWith(
            color: BasicAppColors.white,
            height: 0,
          ),
        ),
      );

  static Widget failure(String value) => Container(
        decoration: const BoxDecoration(
          color: BasicAppColors.red,
          borderRadius: BasicCorners.cornerBorder5,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: BasicPaddings().p8,
          vertical: BasicPaddings().p4,
        ),
        child: Text(
          value,
          style: BasicTextStyles.body.copyWith(
            color: BasicAppColors.white,
            height: 0,
          ),
        ),
      );

  static Widget warning(String value) => Container(
        decoration: const BoxDecoration(
          color: BasicAppColors.yellow,
          borderRadius: BasicCorners.cornerBorder5,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: BasicPaddings().p8,
          vertical: BasicPaddings().p4,
        ),
        child: Text(
          value,
          style: BasicTextStyles.body.copyWith(
            color: BasicAppColors.white,
            height: 0,
          ),
        ),
      );

  static Widget info(String value) => Container(
        decoration: const BoxDecoration(
          color: BasicAppColors.blueLight,
          borderRadius: BasicCorners.cornerBorder5,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: BasicPaddings().p8,
          vertical: BasicPaddings().p4,
        ),
        child: Text(
          value,
          style: BasicTextStyles.body.copyWith(
            color: BasicAppColors.white,
            height: 0,
          ),
        ),
      );
}
