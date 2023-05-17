part of '../data_table.dart';

typedef ShowerMoreContentIntoRowWidget<T> = Widget Function(T rowData);

typedef HeaderIntoRowWidget<T> = Widget? Function(T rowData, Map<String, double> widthOfColumns);

typedef OptionContentTable = Widget Function(List<DataTableColumn> columns, Map<String, double> widthOfColumns);

enum DataTableSortType { asc, desc }

typedef SortDataVoid = void Function({
  required String keyColumn,
  required DataTableSortType typeSort,
});

typedef AsyncDataSource<T> = void Function({
  required int currentPage,
  required int itemsPerPage,
});
