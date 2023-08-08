part of 'data_table.dart';

class BasicDataTable<T> extends StatefulWidget {
  const BasicDataTable({
    Key? key,
    required this.controller,
    required this.tableColumns,
    this.additionColumns = const [],
    this.topContent,
    this.bottomContent,
    this.showerMoreContentIntoRowWidget,
    this.headerIntoRowWidget,
    required this.handleChangeData,
    this.optionUI,
    this.headerOption,
    this.rowOption,
    this.columnOption,
    this.paginationOption,
    this.checkBoxOption,
  }) : super(key: key);

  final DataTableController<T> controller;
  final List<DataTableColumn<T>> tableColumns;
  final List<DataTableAdditionColumn> additionColumns;
  final OptionContentTable? topContent;
  final OptionContentTable? bottomContent;
  final ShowerMoreContentIntoRowWidget<T>? showerMoreContentIntoRowWidget;
  final HeaderIntoRowWidget<T>? headerIntoRowWidget;
  final AsyncDataSource<T> handleChangeData;
  final DataTableOptionUI? optionUI;
  final DataTableHeaderOption? headerOption;
  final DataTableRowOption<T>? rowOption;
  final DataTableColumnOption? columnOption;
  final DataTablePaginationOption? paginationOption;
  final DataTableCheckBoxOption<T>? checkBoxOption;

  @override
  BasicDataTableState<T> createState() => BasicDataTableState<T>();
}

class BasicDataTableState<T> extends State<BasicDataTable<T>> {
  late DataTableController<T> _webDataTableController;
  late final DataTableOptionUI _optionUI;
  late final DataTableHeaderOption _headerOption;
  late final DataTableRowOption<T> _rowOption;
  late final DataTableColumnOption _columnOption;
  late final DataTablePaginationOption _paginationOption;
  late final DataTableCheckBoxOption<T> _checkBoxOption;

  void _handleSetState() {
    if (mounted) setState(() {});
  }

  void _handleInitState({
    bool needToInitPagination = false,
  }) {
    assert(
      widget.tableColumns.map((e) => e.key).toSet().length == widget.tableColumns.length,
      'Mỗi key của từng cột phải khác nhau',
    );
    if (needToInitPagination) {
      _webDataTableController.initPagination(
        currentPage: _paginationOption.currentPage,
        itemsPerPage: _paginationOption.itemsPerPage,
        listItemsPerPage: _paginationOption.listItemsPerPage,
        numberNextPage: _paginationOption.numberNextPage,
      );
    }
    _webDataTableController.initDataTable(
      initTableColumns: widget.tableColumns,
      additionColumns: widget.additionColumns,
    );
    assert(
      _webDataTableController.dataSources.every(
        (element) {
          dynamic elementId = (element as dynamic).toJson()['id'];
          return elementId != null &&
              BasicDynamicExtension.canParseToInt(elementId) &&
              BasicDynamicExtension.isPositiveNumber(elementId);
        },
      ),
      'Tất cả các đối tượng dataSources phải có thuộc tính id dạng int và là số dương',
    );
    assert(
      _webDataTableController.initTableColumns.every(
        (element) =>
            element.fixedColumn == FixedColumn.none ||
            (element.fixedColumn != FixedColumn.none &&
                widget.topContent == null &&
                widget.bottomContent == null &&
                widget.showerMoreContentIntoRowWidget == null &&
                widget.headerIntoRowWidget == null),
      ),
      'Nếu DataTable có FixedColumn thí sẽ không được thêm top hoặc bottom hoặc showMoreContent content',
    );
    assert(
      _webDataTableController.initTableColumns.every(
        (element) =>
            element.fixedColumn == FixedColumn.none ||
            (element.fixedColumn != FixedColumn.none && element.width != null),
      ),
      'Tất cả các cột nếu set FixedColumn left hoặc right đều phải có width',
    );
  }

  @override
  void initState() {
    _webDataTableController = widget.controller;
    _optionUI = widget.optionUI ?? const DataTableOptionUI();
    _headerOption = widget.headerOption ?? const DataTableHeaderOption();
    _rowOption = widget.rowOption ?? const DataTableRowOption();
    _columnOption = widget.columnOption ?? const DataTableColumnOption();
    _paginationOption = widget.paginationOption ?? const DataTablePaginationOption();
    _checkBoxOption = widget.checkBoxOption ?? const DataTableCheckBoxOption();
    _handleInitState(needToInitPagination: true);
    _webDataTableController.addListener(_handleSetState);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BasicDataTable<T> oldWidget) {
    if (widget.controller != oldWidget.controller) {
      _webDataTableController.removeListener(_handleSetState);
      _webDataTableController = widget.controller;
      _handleInitState(needToInitPagination: true);
      _webDataTableController.addListener(_handleSetState);
    }
    if ((widget.tableColumns != oldWidget.tableColumns) ||
        (widget.tableColumns.length != oldWidget.tableColumns.length)) {
      _handleInitState();
      setState(() {});
    }
    if (widget.additionColumns != oldWidget.additionColumns) {
      _webDataTableController.additionColumns = widget.additionColumns;
      _handleInitState();
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _webDataTableController.removeListener(_handleSetState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BasicCorners.cornerBorder8,
              color: context.theme.colorScheme.background,
            ),
            child: _genContentTable(),
          ),
          if (_webDataTableController.isLoading)
            const Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: DataTableLoadingWidget(),
            ),
        ],
      );

  Widget _genContentTable() {
    if (_optionUI.fixTableInAScreen) {
      return FixedDataTableWidget<T>(
        controller: _webDataTableController,
        topContent: widget.topContent,
        bottomContent: widget.bottomContent,
        showerMoreContentIntoRowWidget: widget.showerMoreContentIntoRowWidget,
        handleChangeData: widget.handleChangeData,
        headerOption: _headerOption,
        rowOption: _rowOption,
        columnOption: _columnOption,
        paginationOption: _paginationOption,
        checkBoxOption: _checkBoxOption,
        headerIntoRowWidget: widget.headerIntoRowWidget,
      );
    }
    return DefaultDataTableWidget<T>(
      controller: _webDataTableController,
      topContent: widget.topContent,
      bottomContent: widget.bottomContent,
      showerMoreContentIntoRowWidget: widget.showerMoreContentIntoRowWidget,
      handleChangeData: widget.handleChangeData,
      headerOption: _headerOption,
      rowOption: _rowOption,
      columnOption: _columnOption,
      paginationOption: _paginationOption,
      checkBoxOption: _checkBoxOption,
      headerIntoRowWidget: widget.headerIntoRowWidget,
    );
  }
}