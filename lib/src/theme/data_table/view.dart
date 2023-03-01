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
    this.listItemsPerPage,
    required this.handleChangeData,
    required this.dataTableOptionUI,
    this.sortDataVoid,
    this.additionFilter = const {},
  }) : super(key: key);

  final DataTableController<T> controller;
  final List<DataTableColumn<T>> tableColumns;
  final List<DataTableAdditionColumn> additionColumns;
  final OptionContentTable? topContent;
  final OptionContentTable? bottomContent;
  final ShowerMoreContentIntoRowWidget<T>? showerMoreContentIntoRowWidget;
  final List<int>? listItemsPerPage;
  final AsyncDataSource<T> handleChangeData;
  final DataTableOptionUI dataTableOptionUI;
  final SortDataVoid? sortDataVoid;
  final Map<String, List<PopupMenuItem<String>>> additionFilter;

  @override
  BasicDataTableState<T> createState() => BasicDataTableState<T>();
}

class BasicDataTableState<T> extends State<BasicDataTable<T>> {
  late DataTableController<T> _webDataTableController;

  @override
  void initState() {
    _webDataTableController = widget.controller;
    _webDataTableController.initDataTable(
      initTableColumns: widget.tableColumns,
      additionColumns: widget.additionColumns,
    );
    _webDataTableController.addListener(
      () {
        if (mounted) setState(() {});
      },
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
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BasicDataTable<T> oldWidget) {
    if (widget.controller != oldWidget.controller) {
      _webDataTableController = widget.controller;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        final widthAllColumn = widget.controller.widthOfAllColumns == null ||
                widget.controller.widthOfAllColumns! <= constraints.maxWidth
            ? constraints.maxWidth
            : widget.controller.widthOfAllColumns!;
        return Container(
          decoration: BoxDecoration(
            borderRadius: BasicCorners.cornerBorder8,
            color: context.theme.colorScheme.background,
          ),
          child: _genContentTable(widthAllColumn),
        );
      },
    );
  }

  Widget _genContentTable(double widthAllColumn) {
    if (widget.dataTableOptionUI.fixTableInAScreen) {
      return FixedDataTableWidget<T>(
        controller: _webDataTableController,
        sortDataVoid: widget.sortDataVoid,
        dataTableOptionUI: widget.dataTableOptionUI,
        additionFilter: widget.additionFilter,
        widthAllColumn: widthAllColumn,
        topContent: widget.topContent,
        bottomContent: widget.bottomContent,
        showerMoreContentIntoRowWidget: widget.showerMoreContentIntoRowWidget,
        listItemsPerPage: widget.listItemsPerPage,
        handleChangeData: widget.handleChangeData,
      );
    }
    return DefaultDataTableWidget(
      controller: _webDataTableController,
      sortDataVoid: widget.sortDataVoid,
      dataTableOptionUI: widget.dataTableOptionUI,
      additionFilter: widget.additionFilter,
      widthAllColumn: widthAllColumn,
      topContent: widget.topContent,
      bottomContent: widget.bottomContent,
      showerMoreContentIntoRowWidget: widget.showerMoreContentIntoRowWidget,
      listItemsPerPage: widget.listItemsPerPage,
      handleChangeData: widget.handleChangeData,
    );
  }
}