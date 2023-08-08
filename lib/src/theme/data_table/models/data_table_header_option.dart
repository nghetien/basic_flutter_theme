part of '../data_table.dart';

class DataTableHeaderOption {
  const DataTableHeaderOption({
    this.heightOfHeaderItem,
    this.borderRadius,
    this.alignment,
    this.padding,
  });

  final double? heightOfHeaderItem;
  final Radius? borderRadius;
  final Alignment? alignment;
  final EdgeInsets? padding;
}
