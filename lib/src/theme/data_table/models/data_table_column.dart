part of '../data_table.dart';

class EventReloadFixedColumn {}

enum FixedColumn {
  none,
  left,
  right,
}

typedef CustomizeTitleWidget = Widget Function(
  BuildContext context,
  String columnKey,
  String columnName,
  double? width,
  List<BasicScreenDevice>? showOnScreens,
);

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
    this.maxWidth,
    this.minWidth,
    this.fixedColumn = FixedColumn.none,
    this.flex,
    this.customizeTitleWidget,
    this.showOnScreens,
    this.customizeItemWidget,
  });

  final String key;
  final String name;
  final double? width;
  final double? maxWidth;
  final double? minWidth;
  final FixedColumn fixedColumn;
  final int? flex;
  final CustomizeTitleWidget? customizeTitleWidget;
  final List<BasicScreenDevice>? showOnScreens;
  final TableItemWidget<T>? customizeItemWidget;
}
