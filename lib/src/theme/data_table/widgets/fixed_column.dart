part of '../data_table.dart';

class DataTableFixedColumnWidget<T> extends StatelessWidget {
  const DataTableFixedColumnWidget(
      {Key? key,
      required this.type,
      required this.controller,
      required this.headerOption,
      required this.rowOption,
      required this.checkBoxOption})
      : super(key: key);

  final FixedColumn type;
  final DataTableController<T> controller;
  final DataTableHeaderOption headerOption;
  final DataTableCheckBoxOption<T> checkBoxOption;
  final DataTableRowOption<T> rowOption;

  Border _getBorder() {
    if (type == FixedColumn.left) {
      return Border(
        right: BorderSide(
          color: BasicAppColors.greyOpacity04,
          width: BasicBorders.thin,
        ),
      );
    } else {
      return Border(
        left: BorderSide(
          color: BasicAppColors.greyOpacity04,
          width: BasicBorders.thin,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: _getBorder(),
      ),
      child: Column(
        children: <Widget>[
          DataTableHeaderWidget(
            tableColumns: type == FixedColumn.left
                ? controller.fixedColumnsLeft
                : controller.fixedColumnsRight,
            fixedColumn: type,
            controller: controller,
            headerOption: headerOption,
            checkBoxOption: checkBoxOption,
          ),
          DataTableFixedColumnContentWidget(
            type: type,
            controller: controller,
            rowOption: rowOption,
            checkBoxOption: checkBoxOption,
          ),
        ],
      ),
    );
  }
}
