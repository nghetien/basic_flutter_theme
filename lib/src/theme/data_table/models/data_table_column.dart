part of '../data_table.dart';

typedef TableItemWidget<T> = Widget Function(
  BuildContext context,
  dynamic value,
  T rowData,
  String columnKey,
  String columnName,
  double? width,
  List<BasicScreenDevice>? showOnScreens,
);

class DataTableColumn<T> {
  DataTableColumn({
    required this.key,
    required this.name,
    this.width,
    this.flex,
    this.showOnScreens,
    this.customizeItemWidget,
  });

  final String key;
  final String name;
  final double? width;
  final int? flex;
  final List<BasicScreenDevice>? showOnScreens;
  final TableItemWidget<T>? customizeItemWidget;
}
