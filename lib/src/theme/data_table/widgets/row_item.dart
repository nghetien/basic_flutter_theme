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
    required this.rowOption,
    required this.checkBoxOption,
  }) : super(key: key);

  final FixedColumn fixedColumn;
  final int lengthOfColumn;
  final int indexRow;
  final int indexColumn;
  final T rowData;
  final DataTableController<T> controller;
  final DataTableColumn<T> column;
  final DataTableRowOption<T> rowOption;
  final DataTableCheckBoxOption<T> checkBoxOption;

  @override
  Widget build(BuildContext context) {
    final double? widthOfRowItem = fixedColumn != FixedColumn.none
        ? column.width
        : controller.mapKeyToWidthOfEachColumnContent[column.key];
    return SizedBox(
      width: widthOfRowItem,
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
        child: _getWidgetRowItem(context, column, widthOfRowItem),
      ),
    );
  }

  Widget _getWidgetRowItem(
    BuildContext context,
    DataTableColumn<T> column,
    double? width,
  ) {
    if (column.key == DataTableAdditionColumn.checkbox.toString()) {
      return CheckBoxRowItem(
        rowData: rowData,
        controller: controller,
        onSelectCheckBox: checkBoxOption.onSelectCheckBox,
      );
    }
    if (column.key == DataTableAdditionColumn.numbered.toString()) {
      return _numberedRowItem();
    }
    if (column.customizeItemWidget != null) {
      return Padding(
        padding: rowOption.paddingOfRowItem ?? EdgeInsets.all(BasicPaddings.p4),
        child: column.customizeItemWidget!(
          context,
          (rowData as dynamic).toJson()[column.key],
          rowData,
          column.key,
          column.name,
          width,
          column.showOnScreens,
        ),
      );
    }
    return Container(
      padding: rowOption.paddingOfRowItem ?? EdgeInsets.all(BasicPaddings.p4),
      alignment: column.defaultTextAlignment ?? Alignment.center,
      child: _defaultRowItem(
        value: (rowData as dynamic).toJson()[column.key],
        rowData: rowData,
        maxLines: column.defaultTextMaxLines,
      ),
    );
  }

  Widget _defaultRowItem({
    required dynamic value,
    required T rowData,
    int? maxLines,
  }) =>
      Text(
        value != null ? value.toString() : '',
        style: BasicTextStyles.body,
        maxLines: maxLines,
      );

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