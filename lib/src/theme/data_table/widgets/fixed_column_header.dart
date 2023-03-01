part of '../data_table.dart';

class DataTableFixedColumnHeaderWidget<T> extends StatelessWidget {
  const DataTableFixedColumnHeaderWidget({
    Key? key,
    required this.type,
    required this.controller,
    this.sortDataVoid,
    required this.dataTableOptionUI,
    required this.additionFilter,
  }) : super(key: key);

  final FixedColumn type;
  final DataTableController<T> controller;
  final SortDataVoid? sortDataVoid;
  final DataTableOptionUI dataTableOptionUI;
  final Map<String, List<PopupMenuItem<String>>> additionFilter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: type == FixedColumn.left
          ? controller.widthOfLeftColumns
          : controller.widthOfRightColumns,
      child: DataTableHeaderWidget(
        tableColumns: type == FixedColumn.left
            ? controller.fixedColumnsLeft
            : controller.fixedColumnsRight,
        fixedColumn: type,
        controller: controller,
        sortDataVoid: sortDataVoid,
        dataTableOptionUI: dataTableOptionUI,
        additionFilter: additionFilter,
      ),
    );
  }
}
