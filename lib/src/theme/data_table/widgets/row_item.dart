part of '../data_table.dart';

class DataRowItemWidget<T> extends StatelessWidget {
  const DataRowItemWidget({
    Key? key,
    required this.tableColumnsForScreenWidth,
    required this.controller,
    required this.index,
    required this.rowData,
    this.isShowMore = false,
    this.showerMoreContentRowWidget,
    required this.onPressed,
  }) : super(key: key);

  final List<DataTableColumn<T>> tableColumnsForScreenWidth;
  final DataTableController<T> controller;
  final int index;
  final T rowData;
  final bool isShowMore;
  final VoidCallback onPressed;
  final ShowerMoreContentIntoRowWidget<T>? showerMoreContentRowWidget;

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
        index: index,
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _wrapContent(
          child: Row(
            children: tableColumnsForScreenWidth
                .map<Widget>(
                  (column) => wrapItemWithOutBorder(
                    flex: column.flex,
                    width: _getWidthRowItem(column),
                    child: Padding(
                      padding: EdgeInsets.all(BasicPaddings().p4),
                      child: _getWidgetRowItem(context, column),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        if (isShowMore)
          _wrapShowMore(
            child: showerMoreContentRowWidget!(rowData),
          )
      ],
    );
  }

  Widget _wrapContent({required Widget child}) => Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity04),
          ),
        ),
        child: BasicButton(
          onPressed: onPressed,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          padding: EdgeInsets.zero,
          child: child,
        ),
      );

  Widget _wrapShowMore({required Widget child}) => Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity04),
            right: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity01),
            left: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity01),
          ),
        ),
        child: child,
      );

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
