part of 'data_table.dart';

class DataTableController<T> extends ChangeNotifier {
  late final DataTableState<T> _state;
  List<DataTableColumn<T>> tableColumns = [];
  DataTableAdditionColumn additionColumn = DataTableAdditionColumn.none;

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

  void initDataTable({
    List<DataTableColumn<T>>? tableColumns,
    DataTableAdditionColumn? additionColumn,
  }) {
    this.tableColumns = tableColumns ?? this.tableColumns;
    this.additionColumn = additionColumn ?? this.additionColumn;
  }

  List<T> get dataSources => _state.dataSources;

  int get totalRecords => _state.totalRecords;

  DataTablePagination get pagination => _state.pagination;

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

  void setTableColumns(List<DataTableColumn<T>> tableColumns) => this.tableColumns = tableColumns;

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
}
