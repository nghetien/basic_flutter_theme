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
    required this.handleChangeData,
    this.optionUI = const DataTableOptionUI(),
    this.headerOption = const DataTableHeaderOption(),
    this.rowOption = const DataTableRowOption(),
    this.columnOption = const DataTableColumnOption(),
    this.paginationOption = const DataTablePaginationOption(),
    this.checkBoxOption = const DataTableCheckBoxOption(),
  }) : super(key: key);

  final DataTableController<T> controller;
  final List<DataTableColumn<T>> tableColumns;
  final List<DataTableAdditionColumn> additionColumns;
  final OptionContentTable? topContent;
  final OptionContentTable? bottomContent;
  final ShowerMoreContentIntoRowWidget<T>? showerMoreContentIntoRowWidget;
  final AsyncDataSource<T> handleChangeData;
  final DataTableOptionUI optionUI;
  final DataTableHeaderOption headerOption;
  final DataTableRowOption<T> rowOption;
  final DataTableColumnOption columnOption;
  final DataTablePaginationOption paginationOption;
  final DataTableCheckBoxOption<T> checkBoxOption;

  @override
  BasicDataTableState<T> createState() => BasicDataTableState<T>();
}

class BasicDataTableState<T> extends State<BasicDataTable<T>> {
  late DataTableController<T> _webDataTableController;

  void _handleSetState() {
    if (mounted) setState(() {});
  }

  void _handleInitState() {
    assert(
      widget.tableColumns.map((e) => e.key).toSet().length == widget.tableColumns.length,
      'Mỗi key của từng cột phải khác nhau',
    );
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
      _webDataTableController.initTableColumns.every((element) =>
          element.fixedColumn == FixedColumn.none ||
          (element.fixedColumn != FixedColumn.none &&
              widget.topContent == null &&
              widget.bottomContent == null &&
              widget.showerMoreContentIntoRowWidget == null)),
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
    _handleInitState();
    _webDataTableController.addListener(_handleSetState);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BasicDataTable<T> oldWidget) {
    if (widget.controller != oldWidget.controller) {
      _webDataTableController = widget.controller;
    }
    if ((widget.tableColumns != oldWidget.tableColumns) ||
        (widget.tableColumns.length != oldWidget.tableColumns.length)) {
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
    if (widget.optionUI.fixTableInAScreen) {
      return FixedDataTableWidget<T>(
        controller: _webDataTableController,
        topContent: widget.topContent,
        bottomContent: widget.bottomContent,
        showerMoreContentIntoRowWidget: widget.showerMoreContentIntoRowWidget,
        handleChangeData: widget.handleChangeData,
        headerOption: widget.headerOption,
        rowOption: widget.rowOption,
        columnOption: widget.columnOption,
        paginationOption: widget.paginationOption,
        checkBoxOption: widget.checkBoxOption,
      );
    }
    return DefaultDataTableWidget<T>(
      controller: _webDataTableController,
      topContent: widget.topContent,
      bottomContent: widget.bottomContent,
      showerMoreContentIntoRowWidget: widget.showerMoreContentIntoRowWidget,
      handleChangeData: widget.handleChangeData,
      headerOption: widget.headerOption,
      rowOption: widget.rowOption,
      columnOption: widget.columnOption,
      paginationOption: widget.paginationOption,
      checkBoxOption: widget.checkBoxOption,
    );
  }
}