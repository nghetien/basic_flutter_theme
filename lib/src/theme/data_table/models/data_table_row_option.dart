part of '../data_table.dart';

class DataTableRowOption<T> {
  const DataTableRowOption({
    this.paddingOfRowItem,
    this.heightOfRowItem,
    this.onPressRowItem,
    this.bordered = false,
  });

  final EdgeInsets? paddingOfRowItem;
  final double? heightOfRowItem;
  final Function(T)? onPressRowItem;
  final bool bordered;
}
