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

  static BorderSide getBorderRight({
    required int index,
    required FixedColumn fixedColumn,
    required int lengthOfColumn,
    required bool haveFixedColumnsRight,
  }) {
    Color color = BasicAppColors.white;
    /// fix nó trong tương lai
    // if (fixedColumn == FixedColumn.none && index == lengthOfColumn - 1 && !haveFixedColumnsRight) {
    //   color = Colors.transparent;
    // }
    // if (fixedColumn == FixedColumn.right && index == lengthOfColumn - 1) {
    //   color = Colors.transparent;
    // }
    return BorderSide(
      color: color,
      width: 0,
    );
  }

  static BorderSide getBorderLeft({
    required int index,
    required FixedColumn fixedColumn,
    required int lengthOfColumn,
    required bool haveFixedColumnsLeft,
  }) {
    Color color = BasicAppColors.white;
    /// fix nó trong tương lai
    // if (fixedColumn == FixedColumn.none && index == 0 && !haveFixedColumnsLeft) {
    //   color = Colors.transparent;
    // }
    // if (fixedColumn == FixedColumn.left && index == 0) {
    //   color = Colors.transparent;
    // }
    return BorderSide(
      color: color,
      width: 0,
    );
  }

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
    return BasicCorners.cornerRadius8;
  }

  Radius _getRadiusLeft() {
    if (controller.haveFixedColumnsLeft && fixedColumn == FixedColumn.none) {
      return Radius.zero;
    }
    if (fixedColumn == FixedColumn.right) {
      return Radius.zero;
    }
    return BasicCorners.cornerRadius8;
  }

  Widget _generateHeaderItem() {
    final List<Widget> headers = [];
    for (int index = 0; index < tableColumns.length; index++) {
      if (tableColumns[index].key == DataTableAdditionColumn.numbered.toString()) {
        headers.add(_numberedColumn(index));
      } else if (tableColumns[index].key == DataTableAdditionColumn.checkbox.toString()) {
        headers.add(_checkboxColumn(index));
      } else {
        if (isShowInScreen(tableColumns[index].showOnScreens)) {
          headers.add(
            DataTableHeaderItemWidget(
              index: index,
              lengthOfColumn: tableColumns.length,
              controller: controller,
              column: tableColumns[index],
              dataTableOptionUI: dataTableOptionUI,
              additionFilter: additionFilter,
            ),
          );
        }
      }
    }
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: _getRadiusRight(),
          topLeft: _getRadiusLeft(),
        ),
        color: BasicAppColors().primary,
      ),
      child: Row(
        children: headers,
      ),
    );
  }

  Widget _numberedColumn(int index) => Container(
        width: getWithAdditionColumn(DataTableAdditionColumn.numbered),
        height: defaultHeightHeader,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            left: getBorderLeft(
              index: index,
              fixedColumn: fixedColumn,
              lengthOfColumn: tableColumns.length,
              haveFixedColumnsLeft: controller.haveFixedColumnsLeft,
            ),
            right: getBorderRight(
              index: index,
              fixedColumn: fixedColumn,
              lengthOfColumn: tableColumns.length,
              haveFixedColumnsRight: controller.haveFixedColumnsRight,
            ),
          ),
        ),
        child: Text(
          'No.',
          textAlign: TextAlign.center,
          style: BasicTextStyles.body.copyWith(
            fontWeight: FontWeight.bold,
            color: BasicAppColors.white,
          ),
        ),
      );

  Widget _checkboxColumn(int index) => Container(
        width: getWithAdditionColumn(DataTableAdditionColumn.checkbox),
        height: defaultHeightHeader,
        decoration: BoxDecoration(
          border: Border(
            left: getBorderLeft(
              index: index,
              fixedColumn: fixedColumn,
              lengthOfColumn: tableColumns.length,
              haveFixedColumnsLeft: controller.haveFixedColumnsLeft,
            ),
            right: getBorderRight(
              index: index,
              fixedColumn: fixedColumn,
              lengthOfColumn: tableColumns.length,
              haveFixedColumnsRight: controller.haveFixedColumnsRight,
            ),
          ),
        ),
        child: CheckBoxColumn(
          controller: controller,
        ),
      );
}
