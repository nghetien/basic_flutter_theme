part of '../data_table.dart';

typedef ShowerMoreContentIntoRowWidget<T> = Widget Function(T rowData);

typedef HeaderIntoRowWidget<T> = Widget? Function(T rowData);

typedef OptionContentTable = Widget Function(List<DataTableColumn> columns);

enum DataTableSortType { asc, desc }

typedef SortDataVoid = void Function({
  required String keyColumn,
  required DataTableSortType typeSort,
});

typedef AsyncDataSource<T> = void Function({
  required int currentPage,
  required int itemsPerPage,
});
