part of '../data_table.dart';

class DataTableRowItemWidget<T> extends StatelessWidget {
  const DataTableRowItemWidget({
    Key? key,
    this.fixedColumn = FixedColumn.none,
    required this.lengthOfColumn,
    required this.indexRow,
    required this.indexColumn,
    required this.rowData,
    required this.controller,
    required this.column,
    required this.dataTableOptionUI,
  }) : super(key: key);

  final FixedColumn fixedColumn;
  final int lengthOfColumn;
  final int indexRow;
  final int indexColumn;
  final T rowData;
  final DataTableController<T> controller;
  final DataTableColumn<T> column;
  final DataTableOptionUI dataTableOptionUI;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fixedColumn != FixedColumn.none
          ? column.width
          : controller.mapKeyToWidthOfEachColumnContent[column.key],
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            right: indexColumn < lengthOfColumn - 1
                ? BorderSide(
                    color: BasicAppColors.greyOpacity04,
                    width: BasicBorders.thin,
                  )
                : BorderSide.none,
          ),
        ),
        child: _getWidgetRowItem(context, column),
      ),
    );
  }

  Widget _getWidgetRowItem(BuildContext context, DataTableColumn<T> column) {
    if (column.key == DataTableAdditionColumn.checkbox.toString()) {
      return CheckBoxRowItem(
        rowData: rowData,
        controller: controller,
      );
    }
    if (column.key == DataTableAdditionColumn.numbered.toString()) {
      return _numberedRowItem();
    }
    if (column.customizeItemWidget != null) {
      return Padding(
        padding: dataTableOptionUI.paddingOfRowItem ?? EdgeInsets.all(BasicPaddings.p4),
        child: column.customizeItemWidget!(
          context,
          (rowData as dynamic).toJson()[column.key],
          rowData,
          column.key,
          column.name,
          column.width,
          column.showOnScreens,
        ),
      );
    }
    return Padding(
      padding: dataTableOptionUI.paddingOfRowItem ?? EdgeInsets.all(BasicPaddings.p4),
      child: _defaultRowItem(
        value: (rowData as dynamic).toJson()[column.key],
        rowData: rowData,
      ),
    );
  }

  Widget _defaultRowItem({required dynamic value, required T rowData}) => Text(value.toString());

  Widget _numberedRowItem() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        ((controller.pagination.currentPage - 1) * controller.pagination.itemsPerPage +
                indexRow +
                1)
            .toString(),
        style: BasicTextStyles.body.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}