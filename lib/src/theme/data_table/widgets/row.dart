part of '../data_table.dart';

class DataTableRowWidget<T> extends StatelessWidget {
  const DataTableRowWidget({
    Key? key,
    required this.tableColumns,
    required this.isFixedColumn,
    required this.controller,
    required this.indexRow,
    required this.rowData,
    this.isShowMore = false,
    this.showerMoreContentRowWidget,
    required this.onPressed,
    this.height,
  }) : super(key: key);

  final List<DataTableColumn<T>> tableColumns;
  final bool isFixedColumn;
  final DataTableController<T> controller;
  final int indexRow;
  final T rowData;
  final bool isShowMore;
  final VoidCallback onPressed;
  final ShowerMoreContentIntoRowWidget<T>? showerMoreContentRowWidget;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (isFixedColumn) {
      return Column(
        children: <Widget>[
          _wrapContent(
            child: Row(
              children: _generateRowItem(context),
            ),
          ),
          if (isShowMore)
            _wrapShowMore(
              child: showerMoreContentRowWidget!(rowData),
            )
        ],
      );
    }
    return MeasureSize(
      onChange: (Size size) {
        final bool canEdit = controller.canEditWidthOfEachRow(
          indexRow,
          size.height,
        );
        if(canEdit) controller.reloadHeightFixedContent();
      },
      child: Column(
        children: <Widget>[
          _wrapContent(
            child: Row(
              children: _generateRowItem(context),
            ),
          ),
          if (isShowMore)
            _wrapShowMore(
              child: showerMoreContentRowWidget!(rowData),
            )
        ],
      ),
    );
  }

  List<Widget> _generateRowItem(BuildContext context) {
    final List<Widget> rowItems = [];
    for (int index = 0; index < tableColumns.length; index++) {
      if (isShowInScreen(tableColumns[index].showOnScreens)) {
        rowItems.add(
          DataTableRowItemWidget(
            index: indexRow,
            rowData: rowData,
            controller: controller,
            column: tableColumns[index],
          ),
        );
      }
    }
    return rowItems;
  }

  Widget _wrapContent({required Widget child}) => Container(
        height: height,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: BasicBorders.thin,
              color: BasicAppColors.greyOpacity04,
            ),
          ),
        ),
        child: isFixedColumn || controller.haveFixedColumnsLeft || controller.haveFixedColumnsRight
            ? child
            : BasicButton(
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
            right: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity04),
            left: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity04),
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(BasicPaddings().p4),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: BasicBorders.thick, color: BasicAppColors().primary),
              left: BorderSide(width: BasicBorders.thick, color: BasicAppColors().primary),
            ),
          ),
          child: child,
        ),
      );
}
