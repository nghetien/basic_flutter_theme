part of 'data_table.dart';

class DataTableState<T> {
  DataTableState({
    List<T>? dataSources,
    int? totalRecords,
    Map<int, T>? dataSelected,
  })  : dataSources = dataSources ?? <T>[],
        totalRecords = totalRecords ?? 0,
        dataSelected = dataSelected ?? <int, T>{};

  late List<T> dataSources;
  late int totalRecords;
  DataTablePagination pagination = DataTablePagination();

  // Map giữa id và data
  late Map<int, T> dataSelected; // Sử dụng khi DataTableAdditionColumn là checkbox

  double? widthOfAllColumns;

  List<DataTableColumn<T>> tableColumnsContent = [];
  List<DataTableColumn<T>> fixedColumnsLeft = [];
  // double? widthOfLeftColumns;
  List<DataTableColumn<T>> fixedColumnsRight = [];
  // double? widthOfRightColumns;

  Map<int, double?> mapIndexToWidthOfEachRow = {};
}
