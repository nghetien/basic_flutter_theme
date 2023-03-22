part of '../data_table.dart';

class DataTableFixedColumnWidget<T> extends StatelessWidget {
  const DataTableFixedColumnWidget({
    Key? key,
    required this.type,
    required this.controller,
    this.sortDataVoid,
    required this.dataTableOptionUI,
    required this.additionFilter,
    this.onPressRowItem,
  }) : super(key: key);

  final FixedColumn type;
  final DataTableController<T> controller;
  final SortDataVoid? sortDataVoid;
  final DataTableOptionUI dataTableOptionUI;
  final Map<String, List<PopupMenuItem<String>>> additionFilter;
  final Function(T)? onPressRowItem;

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
            sortDataVoid: sortDataVoid,
            dataTableOptionUI: dataTableOptionUI,
            additionFilter: additionFilter,
          ),
          DataTableFixedColumnContentWidget(
            type: type,
            controller: controller,
            onPressRowItem: onPressRowItem,
            dataTableOptionUI: dataTableOptionUI,
          ),
        ],
      ),
    );
  }
}
