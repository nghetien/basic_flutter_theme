part of '../data_table.dart';

class DataTableHeaderWidget<T> extends StatefulWidget {
  const DataTableHeaderWidget({
    Key? key,
    required this.tableColumns,
    this.fixedColumn = FixedColumn.none,
    required this.controller,
    required this.headerOption,
    required this.checkBoxOption,
  }) : super(key: key);

  final List<DataTableColumn<T>> tableColumns;
  final FixedColumn fixedColumn;
  final DataTableController<T> controller;
  final DataTableHeaderOption headerOption;
  final DataTableCheckBoxOption<T> checkBoxOption;

  static final double defaultHeightHeader = 40.scaleSize;

  @override
  State<DataTableHeaderWidget<T>> createState() => _DataTableHeaderWidgetState<T>();
}

class _DataTableHeaderWidgetState<T> extends State<DataTableHeaderWidget<T>> {
  MapEntry<String, DataTableSortType> _sortType = const MapEntry('', DataTableSortType.none);

  MapEntry<String, DataTableSortType> get sortType => _sortType;

  void _setSortType(MapEntry<String, DataTableSortType> value) => setState(() => _sortType = value);

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, __) => _generateHeaderItem(),
      );

  Radius _getRadiusRight() {
    if (widget.controller.haveFixedColumnsRight && widget.fixedColumn == FixedColumn.none) {
      return Radius.zero;
    }
    if (widget.fixedColumn == FixedColumn.left) {
      return Radius.zero;
    }
    return widget.headerOption.borderRadius ?? BasicCorners.mainCornerRadius;
  }

  Radius _getRadiusLeft() {
    if (widget.controller.haveFixedColumnsLeft && widget.fixedColumn == FixedColumn.none) {
      return Radius.zero;
    }
    if (widget.fixedColumn == FixedColumn.right) {
      return Radius.zero;
    }
    return widget.headerOption.borderRadius ?? BasicCorners.mainCornerRadius;
  }

  Widget _generateHeaderItem() {
    final List<Widget> headers = [];
    for (int index = 0; index < widget.tableColumns.length; index++) {
      if (isShowInScreen(widget.tableColumns[index].showOnScreens)) {
        headers.add(
          DataTableHeaderItemWidget(
            key: ValueKey(widget.tableColumns[index].key),
            index: index,
            lengthOfColumn: widget.tableColumns.length,
            controller: widget.controller,
            column: widget.tableColumns[index],
            fixedColumn: widget.fixedColumn,
            headerOption: widget.headerOption,
            checkBoxOption: widget.checkBoxOption,
            sortType: sortType,
            onSelectSortType: _setSortType,
          ),
        );
      }
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: _getRadiusRight(),
          topLeft: _getRadiusLeft(),
        ),
        color: BasicAppColors.primary,
      ),
      child: Row(
        children: headers,
      ),
    );
  }
}
