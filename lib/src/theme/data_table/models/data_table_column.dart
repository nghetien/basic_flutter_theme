part of '../data_table.dart';

class EventReloadFixedColumn {}

enum FixedColumn {
  none,
  left,
  right,
}

class FilterHeaderItem<T> {
  const FilterHeaderItem({
    this.offset,
    required this.heightPopup,
    required this.widthPopup,
    required this.child,
  });

  final Offset? offset;
  final double heightPopup;
  final double widthPopup;
  final CustomizeFilterWidget<T> child;
}

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
    this.isShowSort = false,
    this.sortDataVoid,
    this.isShowFilter = false,
    this.customizeFilter,
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
  final bool isShowSort;
  final SortDataVoid<T>? sortDataVoid;
  final bool isShowFilter;
  final FilterHeaderItem<T>? customizeFilter;
}
