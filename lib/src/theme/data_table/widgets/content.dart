part of '../data_table.dart';

class DataTableContentWidget<T> extends StatefulWidget {
  const DataTableContentWidget({
    Key? key,
    required this.tableColumns,
    this.fixedColumn = FixedColumn.none,
    required this.controller,
    this.topContent,
    this.bottomContent,
    this.showerMoreContentRowWidget,
    this.verticalScrollState,
    required this.rowOption,
    required this.checkBoxOption,
  }) : super(key: key);

  final List<DataTableColumn<T>> tableColumns;
  final FixedColumn fixedColumn;
  final DataTableController<T> controller;
  final OptionContentTable? topContent;
  final OptionContentTable? bottomContent;
  final ShowerMoreContentIntoRowWidget<T>? showerMoreContentRowWidget;
  final BasicVerticalScrollState? verticalScrollState;
  final DataTableRowOption<T> rowOption;
  final DataTableCheckBoxOption<T> checkBoxOption;

  @override
  DataTableContentWidgetState<T> createState() => DataTableContentWidgetState<T>();
}

class DataTableContentWidgetState<T> extends State<DataTableContentWidget<T>> {
  int _expandedDataIndex = -1;
  List<T> _oldStateDataSource = [];
  bool isCompareDataSource = false;

  bool _isChangeDataSource() {
    if(!isCompareDataSource){
      isCompareDataSource = true;
      return false;
    }
    if (_oldStateDataSource.isEmpty && widget.controller.dataSources.isEmpty) return false;
    if (_oldStateDataSource.length != widget.controller.dataSources.length) return true;
    for (int i = 0; i < _oldStateDataSource.length; i++) {
      if ((_oldStateDataSource[i] as dynamic).toJson()['id'] !=
          (widget.controller.dataSources[i] as dynamic).toJson()['id']) return true;
    }
    return false;
  }

  bool _isShowMore(int index) => _expandedDataIndex == index;

  void _handleChangeOldDataSource() {
    if (_isChangeDataSource()) {
      _oldStateDataSource = [...widget.controller.dataSources];
      _expandedDataIndex = -1;
    }
  }

  void _handleClickContent(int index, T rowData){
    widget.rowOption.onPressRowItem?.call(rowData);
    if (widget.showerMoreContentRowWidget != null) {
      isCompareDataSource = false;
      _expandedDataIndex = _expandedDataIndex != index ? index : -1;
      widget.verticalScrollState?.calculateScroll();
      widget.verticalScrollState?.setState(() {});
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    _handleChangeOldDataSource();
    return Column(
      children: <Widget>[
        if (widget.topContent != null)
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity04),
                right: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity01),
                left: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity01),
              ),
            ),
            child: widget.topContent!(widget.controller.initTableColumns),
          ),
        _contents(),
        if (widget.bottomContent != null)
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity04),
                right: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity01),
                left: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity01),
              ),
            ),
            child: widget.bottomContent!(widget.controller.initTableColumns),
          ),
      ],
    );
  }

  double? getHeightOfRow(int index) {
    if (widget.rowOption.heightOfRowItem != null) {
      return widget.rowOption.heightOfRowItem;
    }
    if (widget.fixedColumn != FixedColumn.none &&
        widget.controller.mapIndexToHeightOfEachRow.isNotEmpty &&
        widget.controller.mapIndexToHeightOfEachRow[index] != null) {
      return widget.controller.mapIndexToHeightOfEachRow[index]!;
    }
    return null;
  }

  Widget _contents() => ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: widget.controller.dataSources.length,
        itemBuilder: (context, index) {
          T rowData = widget.controller.dataSources[index];
          return Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 0, color: BasicAppColors.greyOpacity01),
                left: BorderSide(width: 0, color: BasicAppColors.greyOpacity01),
              ),
            ),
            child: DataTableRowWidget<T>(
              key: ObjectKey(rowData),
              tableColumns: widget.tableColumns,
              fixedColumn: widget.fixedColumn,
              height: getHeightOfRow(index),
              controller: widget.controller,
              indexRow: index,
              rowData: rowData,
              isShowMore: _isShowMore(index),
              onPressed: () => _handleClickContent(index, rowData),
              showerMoreContentRowWidget: widget.showerMoreContentRowWidget,
              rowOption: widget.rowOption,
              checkBoxOption: widget.checkBoxOption,
            ),
          );
        },
      );
}
