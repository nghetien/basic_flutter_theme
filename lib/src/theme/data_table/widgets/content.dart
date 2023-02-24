part of '../data_table.dart';

class DataTableContentWidget<T> extends StatefulWidget {
  const DataTableContentWidget({
    Key? key,
    required this.controller,
    this.topContent,
    this.bottomContent,
    this.showerMoreContentRowWidget,
  }) : super(key: key);

  final DataTableController<T> controller;
  final OptionContentTable? topContent;
  final OptionContentTable? bottomContent;
  final ShowerMoreContentIntoRowWidget<T>? showerMoreContentRowWidget;

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

  void _handleClickContent(int index){
    if (widget.showerMoreContentRowWidget != null) {
      isCompareDataSource = false;
      setState(() => _expandedDataIndex = _expandedDataIndex != index ? index : -1);
    }
  }

  @override
  Widget build(BuildContext context) {
    _handleChangeOldDataSource();
    final List<DataTableColumn<T>> tableColumnsForScreenWidth =
        getListColumnForScreenDevice(widget.controller.tableColumns);
    return Column(
      children: <Widget>[
        if (widget.topContent != null)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity04),
                right: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity01),
                left: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity01),
              ),
            ),
            child: widget.topContent!(tableColumnsForScreenWidth),
          ),
        ..._contents(
          tableColumnsForScreenWidth: tableColumnsForScreenWidth,
        ),
        if (widget.bottomContent != null)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity04),
                right: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity01),
                left: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity01),
              ),
            ),
            child: widget.bottomContent!(tableColumnsForScreenWidth),
          ),
      ],
    );
  }

  Iterable<DataRowItemWidget<T>> _contents({
    required List<DataTableColumn<T>> tableColumnsForScreenWidth,
  }) {
    return widget.controller.dataSources.asMap().entries.map(
      (entry) {
        int index = entry.key;
        T rowData = entry.value;
        return DataRowItemWidget<T>(
          tableColumnsForScreenWidth: tableColumnsForScreenWidth,
          controller: widget.controller,
          index: index,
          rowData: rowData,
          isShowMore: _isShowMore(index),
          onPressed: () => _handleClickContent(index),
          showerMoreContentRowWidget: widget.showerMoreContentRowWidget,
        );
      },
    );
  }
}
