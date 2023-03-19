part of '../data_table.dart';

class DataTableHeaderWidget<T> extends StatelessWidget {
  const DataTableHeaderWidget({
    Key? key,
    required this.tableColumns,
    this.fixedColumn = FixedColumn.none,
    required this.controller,
    this.sortDataVoid,
    required this.dataTableOptionUI,
    required this.additionFilter,
  }) : super(key: key);

  final List<DataTableColumn<T>> tableColumns;
  final FixedColumn fixedColumn;
  final DataTableController<T> controller;
  final SortDataVoid? sortDataVoid;
  final DataTableOptionUI dataTableOptionUI;
  final Map<String, List<PopupMenuItem<String>>> additionFilter;

  static final double defaultHeightHeader = 40.scaleSize;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, __) => _generateHeaderItem(),
      );

  Radius _getRadiusRight() {
    if (controller.haveFixedColumnsRight && fixedColumn == FixedColumn.none) {
      return Radius.zero;
    }
    if (fixedColumn == FixedColumn.left) {
      return Radius.zero;
    }
    return BasicCorners.cornerRadius5;
  }

  Radius _getRadiusLeft() {
    if (controller.haveFixedColumnsLeft && fixedColumn == FixedColumn.none) {
      return Radius.zero;
    }
    if (fixedColumn == FixedColumn.right) {
      return Radius.zero;
    }
    return BasicCorners.cornerRadius5;
  }

  Widget _generateHeaderItem() {
    final List<Widget> headers = [];
    for (int index = 0; index < tableColumns.length; index++) {
      if (isShowInScreen(tableColumns[index].showOnScreens)) {
        headers.add(
          DataTableHeaderItemWidget(
            index: index,
            lengthOfColumn: tableColumns.length,
            controller: controller,
            column: tableColumns[index],
            dataTableOptionUI: dataTableOptionUI,
            additionFilter: additionFilter,
            fixedColumn: fixedColumn,
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
