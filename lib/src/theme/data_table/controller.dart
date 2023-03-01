part of 'data_table.dart';

class DataTableController<T> extends ChangeNotifier {
  late final DataTableState<T> _state;
  List<DataTableColumn<T>> initTableColumns = [];
  List<DataTableAdditionColumn> additionColumns = [];
  final reloadFixedColumnStreamController = StreamController<EventReloadFixedColumn>.broadcast();

  DataTableController({
    List<T>? dataSources,
    int? totalRecords,
    Map<int, T>? dataSelected,
  }) : _state = DataTableState<T>(
          dataSources: dataSources,
          totalRecords: totalRecords,
          dataSelected: dataSelected,
        );

  void initDataTableState({
    List<T>? dataSources,
    int? totalRecords,
    Map<int, T>? dataSelected,
  }) {
    _state.dataSources = dataSources ?? _state.dataSources;
    _state.totalRecords = totalRecords ?? _state.totalRecords;
    _state.dataSelected = dataSelected ?? _state.dataSelected;
  }

  void clearDataTable() {
    this.initTableColumns = [];
    this.additionColumns = [];
    _state.fixedColumnsLeft = [];
    _state.fixedColumnsRight = [];
    _state.tableColumnsContent = [];
    _state.widthOfAllColumns = null;
  }

  void initDataTable({
    List<DataTableColumn<T>>? initTableColumns,
    List<DataTableAdditionColumn> additionColumns = const [],
  }) {
    clearDataTable();
    this.initTableColumns = initTableColumns ?? this.initTableColumns;
    this.additionColumns = additionColumns;
    final List<DataTableColumn<T>> tableColumnsContent = [];
    for (var element in this.initTableColumns) {
      if (element.fixedColumn == FixedColumn.left) {
        _state.fixedColumnsLeft.add(element);
      } else if (element.fixedColumn == FixedColumn.right) {
        _state.fixedColumnsRight.add(element);
      } else {
        tableColumnsContent.add(element);
      }
    }
    if (this.additionColumns.isNotEmpty) {
      for (var element in this.additionColumns) {
        if (haveFixedColumnsLeft) {
          _state.fixedColumnsLeft.insert(
            0,
            DataTableColumn<T>(
              name: '',
              key: element.toString(),
              width: getWithAdditionColumn(element),
            ),
          );
        } else {
          tableColumnsContent.insert(
            0,
            DataTableColumn<T>(
              name: '',
              key: element.toString(),
              width: getWithAdditionColumn(element),
            ),
          );
        }
      }
    }
    _state.tableColumnsContent = tableColumnsContent;
    _state.widthOfAllColumns = getWidthOfColumn(this.initTableColumns);
  }

  List<T> get dataSources => _state.dataSources;

  int get totalRecords => _state.totalRecords;

  DataTablePagination get pagination => _state.pagination;

  double? get widthOfAllColumns => _state.widthOfAllColumns;

  List<DataTableColumn<T>> get tableColumnsContent => _state.tableColumnsContent;

  List<DataTableColumn<T>> get fixedColumnsLeft => _state.fixedColumnsLeft;

  List<DataTableColumn<T>> get fixedColumnsRight => _state.fixedColumnsRight;

  bool get haveFixedColumnsLeft => _state.fixedColumnsLeft.isNotEmpty;

  bool get haveFixedColumnsRight => _state.fixedColumnsRight.isNotEmpty;

  Map<int, double?> get mapIndexToWidthOfEachRow => _state.mapIndexToWidthOfEachRow;

  double? get widthOfLeftColumns => getWidthOfColumn(_state.fixedColumnsLeft);

  double? get widthOfRightColumns => getWidthOfColumn(_state.fixedColumnsRight);

  void setDataSources(List<T> dataSources) {
    _state.dataSources = dataSources;
    notifyListeners();
  }

  void reloadDataTable() => notifyListeners();

  void resetFirstPage() {
    _state.pagination.currentPage = 1;
    calculatePagination();
    notifyListeners();
  }

  void setTotalRecords(int totalRecords) {
    _state.totalRecords = totalRecords;
    notifyListeners();
  }

  void sort([int Function(T a, T b)? compare]) {
    _state.dataSources.sort(compare);
    notifyListeners();
  }

  // void setTableColumns(List<DataTableColumn<T>> tableColumns) => this.tableColumns = tableColumns;

  void initPagination({
    List<int>? initListItemsPerPage,
    int? numberNextPage,
  }) {
    final List<int> listItemsPerPage =
        initListItemsPerPage ?? DataTablePagination.defaultListItemsPerPage;
    _state.pagination = DataTablePagination(
      pageNumber: calculatePageNumber(listItemsPerPage[0]),
      itemsPerPage: listItemsPerPage[0],
      listItemsPerPage: initListItemsPerPage,
      numberNextPage: numberNextPage,
    );
    calculatePagination();
  }

  void calculatePagination() => _state.pagination.calculatePagination();

  void setCurrentPage(int currentPage) {
    _state.pagination.currentPage = currentPage;
    notifyListeners();
  }

  void setItemsPerPage(int itemsPerPage) => _state.pagination.itemsPerPage = itemsPerPage;

  void setPageNumber(int pageNumber) => _state.pagination.pageNumber = pageNumber;

  int calculatePageNumber(int itemPerPage) => (_state.totalRecords / itemPerPage).ceil();

  void selectAll(bool withValue) {
    if (withValue) {
      _state.dataSelected = {};
      for (var element in dataSources) {
        _state.dataSelected[(element as dynamic).toJson()['id']] = element;
      }
    } else {
      _state.dataSelected = {};
    }
    notifyListeners();
  }

  bool elementIsSelected(T data) =>
      _state.dataSelected.containsKey((data as dynamic).toJson()['id']);

  void selectElement(bool value, T data) {
    if (value) {
      _state.dataSelected[(data as dynamic).toJson()['id']] = data;
    } else {
      _state.dataSelected.remove((data as dynamic).toJson()['id']);
    }
    notifyListeners();
  }

  void clearSelected() {
    _state.dataSelected = {};
    notifyListeners();
  }

  bool canEditWidthOfEachRow(int index, double? value) {
    if (value != _state.mapIndexToWidthOfEachRow[index]) {
      _state.mapIndexToWidthOfEachRow[index] = value;
      return true;
    }
    return false;
  }

  double? getWidthOfColumn(List<DataTableColumn<T>> columns) {
    double widthOfAllColumns = 0;
    for (final column in columns) {
      if (column.width == null && column.minWidth == null) {
        return null;
      }
      widthOfAllColumns += column.width ?? column.minWidth!;
    }
    return widthOfAllColumns;
  }

  void reloadHeightFixedContent() =>
      reloadFixedColumnStreamController.add(EventReloadFixedColumn());
}
