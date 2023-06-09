part of '../data_table.dart';

enum DataTableSortType { asc, desc, none }

typedef ShowerMoreContentIntoRowWidget<T> = Widget Function(T rowData);

typedef HeaderIntoRowWidget<T> = Widget? Function(T rowData, Map<String, double> widthOfColumns);

typedef OptionContentTable = Widget Function(
    List<DataTableColumn> columns, Map<String, double> widthOfColumns);

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

typedef HandleFilterDataFunction<T> = void Function({
  required List<T> dataSources,
  int? totalRecords,
  int? currentPage,
  int? itemsPerPage,
  int? pageNumber,
});

typedef CustomizeFilterWidget<T> = Widget Function(
  BuildContext context,
  String columnKey,
  String columnName,
  bool enableFilter,
  bool isShowMenu,
  ValueChanged<bool> changeFilter,
  ValueChanged<bool> changeShowMenu,
  HandleFilterDataFunction<T> handleFilterData,
);

typedef SortDataVoid<T> = void Function(
  String keyColumn,
  DataTableSortType typeSort,
  HandleFilterDataFunction<T> handleFilterData,
);

typedef AsyncDataSource<T> = void Function({
  required int currentPage,
  required int itemsPerPage,
});
