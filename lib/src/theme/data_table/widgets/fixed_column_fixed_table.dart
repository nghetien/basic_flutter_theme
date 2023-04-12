part of '../data_table.dart';

class FixedColumnForFixedTable<T> extends StatelessWidget {
  const FixedColumnForFixedTable({
    Key? key,
    required this.type,
    required this.controller,
    required this.verticalFixedColumnScrollController,
    required this.headerOption,
    required this.rowOption,
    required this.checkBoxOption,
  }) : super(key: key);

  final FixedColumn type;
  final DataTableController<T> controller;
  final ScrollController verticalFixedColumnScrollController;
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
            checkBoxOption: checkBoxOption,
            headerOption: headerOption,
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                controller: verticalFixedColumnScrollController,
                scrollDirection: Axis.vertical,
                child: DataTableFixedColumnContentWidget<T>(
                  type: type,
                  controller: controller,
                  checkBoxOption: checkBoxOption,
                  rowOption: rowOption,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
