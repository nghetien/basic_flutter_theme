part of '../data_table.dart';

class DataTableRowItemWidget<T> extends StatelessWidget {
  const DataTableRowItemWidget({
    Key? key,
    required this.index,
    required this.rowData,
    required this.controller,
    required this.column,
  }) : super(key: key);

  final int index;
  final T rowData;
  final DataTableController<T> controller;
  final DataTableColumn<T> column;

  @override
  Widget build(BuildContext context) {
    return _wrapItemWithOutBorder(
      flex: column.flex,
      width: _getWidthRowItem(column),
      child: Padding(
        padding: EdgeInsets.all(BasicPaddings().p4),
        child: _getWidgetRowItem(context, column),
      ),
    );
  }

  Widget _wrapItemWithOutBorder({
    required Widget child,
    double? width,
    int? flex,
  }) {
    return width != null
        ? SizedBox(
            width: width,
            child: child,
          )
        : Expanded(
            flex: flex ?? 1,
            child: LayoutBuilder(
              builder: (_, BoxConstraints constraints) {
                if (column.maxWidth != null && (constraints.maxWidth > column.maxWidth!)) {
                  return SizedBox(
                    width: column.maxWidth,
                    child: child,
                  );
                }
                if (column.minWidth != null && constraints.maxWidth < column.minWidth!) {
                  return SizedBox(
                    width: column.minWidth,
                    child: child,
                  );
                }
                return child;
              },
            ),
          );
  }

  double? _getWidthRowItem(DataTableColumn<T> column) {
    if (column.key == DataTableAdditionColumn.checkbox.toString()) {
      return getWithAdditionColumn(DataTableAdditionColumn.checkbox);
    }
    if (column.key == DataTableAdditionColumn.numbered.toString()) {
      return getWithAdditionColumn(DataTableAdditionColumn.numbered);
    }
    return column.width;
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
      return column.customizeItemWidget!(
        context,
        (rowData as dynamic).toJson()[column.key],
        rowData,
        column.key,
        column.name,
        column.width,
        column.showOnScreens,
      );
    }
    return _defaultRowItem(
      value: (rowData as dynamic).toJson()[column.key],
      rowData: rowData,
    );
  }

  Widget _defaultRowItem({required dynamic value, required T rowData}) => Text(value.toString());

  Widget _numberedRowItem() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        ((controller.pagination.currentPage - 1) * controller.pagination.itemsPerPage + index + 1)
            .toString(),
        style: BasicTextStyles.body.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}