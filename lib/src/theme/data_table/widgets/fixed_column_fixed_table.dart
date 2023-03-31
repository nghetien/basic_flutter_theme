part of '../data_table.dart';

class FixedColumnForFixedTable<T> extends StatelessWidget {
  const FixedColumnForFixedTable({
    Key? key,
    required this.type,
    required this.controller,
    this.sortDataVoid,
    required this.dataTableOptionUI,
    required this.additionFilter,
    required this.verticalFixedColumnScrollController,
    this.onPressRowItem,
    this.onSelectCheckBox,
  }) : super(key: key);

  final FixedColumn type;
  final DataTableController<T> controller;
  final SortDataVoid? sortDataVoid;
  final DataTableOptionUI dataTableOptionUI;
  final Map<String, List<PopupMenuItem<String>>> additionFilter;
  final ScrollController verticalFixedColumnScrollController;
  final Function(T)? onPressRowItem;
  final Function(Map<int, T>)? onSelectCheckBox;

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
            onSelectCheckBox: onSelectCheckBox,
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
                  onPressRowItem: onPressRowItem,
                  dataTableOptionUI: dataTableOptionUI,
                  onSelectCheckBox: onSelectCheckBox,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
