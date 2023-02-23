part of 'data_table.dart';

class BasicDataTable<T> extends StatefulWidget {
  const BasicDataTable({
    Key? key,
    required this.controller,
    required this.tableColumns,
    this.additionColumn = DataTableAdditionColumn.none,
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
  final DataTableAdditionColumn additionColumn;
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
  List<DataTableColumn<T>> _tableColumns = [];

  @override
  void initState() {
    _webDataTableController = widget.controller;
    _webDataTableController.initDataTable(
      tableColumns: widget.tableColumns,
      additionColumn: widget.additionColumn,
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
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BasicDataTable<T> oldWidget) {
    if (widget.controller != oldWidget.controller) {
      _webDataTableController = widget.controller;
    }
    super.didUpdateWidget(oldWidget);
  }

  void _saveAndInsertAdditionColumn() {
    _tableColumns = [...widget.tableColumns];
    if (widget.additionColumn != DataTableAdditionColumn.none) {
      _tableColumns.insert(
        0,
        DataTableColumn<T>(
          name: '',
          key: widget.additionColumn.toString(),
          width: getWithAdditionColumn(widget.additionColumn),
        ),
      );
    }
    _webDataTableController.setTableColumns(_tableColumns);
  }

  @override
  Widget build(BuildContext context) {
    _saveAndInsertAdditionColumn();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BasicCorners.cornerBorder8,
        color: context.theme.colorScheme.background,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DataTableHeaderWidget<T>(
            controller: _webDataTableController,
            sortDataVoid: widget.sortDataVoid,
            dataTableOptionUI: widget.dataTableOptionUI,
            additionFilter: widget.additionFilter,
          ),
          widget.dataTableOptionUI.fixTableInAScreen
              ? Expanded(
                  child: SingleChildScrollView(
                    child: DataTableContentWidget<T>(
                      controller: _webDataTableController,
                      topContent: widget.topContent,
                      bottomContent: widget.bottomContent,
                      showerMoreContentRowWidget: widget.showerMoreContentIntoRowWidget,
                    ),
                  ),
                )
              : DataTableContentWidget<T>(
                  controller: _webDataTableController,
                  topContent: widget.topContent,
                  bottomContent: widget.bottomContent,
                  showerMoreContentRowWidget: widget.showerMoreContentIntoRowWidget,
                ),
          DataTablePaginationWidget(
            controller: _webDataTableController,
            initListItemsPerPage: widget.listItemsPerPage,
            handleChangeData: widget.handleChangeData,
            dataTableOptionUI: widget.dataTableOptionUI,
          ),
        ],
      ),
    );
  }
}
