part of '../data_table.dart';

class DataTableFixedColumnWidget<T> extends StatelessWidget {
  const DataTableFixedColumnWidget({
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
    return Container(
      decoration: BoxDecoration(
        border: _getBorder(),
      ),
      child: Column(
        children: <Widget>[
          DataTableFixedColumnHeaderWidget(
            type: type,
            controller: controller,
            sortDataVoid: sortDataVoid,
            dataTableOptionUI: dataTableOptionUI,
            additionFilter: additionFilter,
          ),
          DataTableFixedColumnContentWidget(
            type: type,
            controller: controller,
          ),
        ],
      ),
    );
  }

  Border _getBorder() {
    if (type == FixedColumn.left) {
      return Border(
        right: BorderSide(
          color: BasicAppColors.greyOpacity04,
          width: 0.5,
        ),
      );
    }
    return Border(
      left: BorderSide(
        color: BasicAppColors.greyOpacity04,
        width: 0.5,
      ),
    );
  }
}
